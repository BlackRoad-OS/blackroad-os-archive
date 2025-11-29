# Trinary Encoding Specification (Base27, Base81, Base729)

**Category:** IP | Protocol
**Source Repo:** `BlackRoad-OS/blackroad-os-archive`
**Source Path:** `ip/trinary-encoding-spec.md`
**Source Commit:** `N/A (initial archival in this repository)`
**Archived On:** 2025-11-28
**Archived By:** agent:gpt-5.1-codex-max
**Status:** Living Document

---

## Purpose

Define a balanced-ternary encoding stack that bridges binary data to higher-density alphabets suitable for RoadChain and related Lucidia components. The spec emphasizes deterministic mapping, collision-free symbol choices, and graceful handling of paraconsistent states (−1, 0, +1) used in the coherence formula:

\[ C(t) = \frac{\Psi'(M_t) + \delta_t}{1 + |\delta_t|} \]

## Balanced Ternary Model

- **Digits (trits):** −1, 0, +1
- **Semantics:**
  - −1 → Negation / contradiction
  - 0 → Null / unknown / superposition
  - +1 → Affirmation / confirmation
- **Information density:** log₂(3) ≈ 1.585 bits per trit.
- **Normalization:** The absolute value in the coherence formula collapses sign while preserving contradiction magnitude, making balanced ternary a native fit.

## Alphabet Tiers

### Base27 (3³)
- **Symbols:** `A`–`Z`, `_` (27 total)
- **Indexing:** `0–25` map to `A`–`Z`; `26` maps to `_`.
- **Use Cases:** Compact labels, namespace prefixes, checksum syllables.

### Base81 (3⁴)
- **Symbols:**
  - 26 uppercase: `A–Z`
  - 26 lowercase: `a–z`
  - 10 digits: `0–9`
  - 19 specials: `! @ # $ % ^ & * ( ) - _ = + [ ] { } |`
- **Ordering (value → symbol):**
  - `0–25`: `A–Z`
  - `26–51`: `a–z`
  - `52–61`: `0–9`
  - `62 → !`, `63 → @`, `64 → #`, `65 → $`, `66 → %`, `67 → ^`, `68 → &`, `69 → *`, `70 → (`, `71 → )`, `72 → -`, `73 → _`, `74 → =`, `75 → +`, `76 → [`, `77 → ]`, `78 → {`, `79 → }`, `80 → |`
- **Rationale for specials:** All ASCII, visually distinct, shell-safe, and avoid whitespace/quote ambiguity.
- **Use Cases:** URI-safe payloads, human-facing keys, structured labels where case sensitivity is acceptable.

### Base729 (3⁶)
- **Symbolization options:**
  1. **Base27 pairs (recommended):** Encode each 6-trit block as two Base27 symbols (27 × 27 = 729). Example mapping: high-order trits → first symbol; low-order trits → second symbol.
  2. **Base81 digraphs:** Use two Base81 symbols but restrict to the first 729 combinations for backward compatibility; reject/flag overflow combos `>=729`.
  3. **Unicode glyph set:** Reserve a contiguous Unicode block (e.g., Mathematical Operators) and map indices directly for dense, single-symbol rendering.
- **Use Cases:** High-density archival strings, PS-SHA∞ representations, inter-agent coherence payloads.

## Encoding Pipeline

1. **Binary → Integer:** Treat the byte string as a big-endian integer.
2. **Integer → Balanced Ternary:** Repeatedly divide by 3; remap remainders `0,1,2` to ternary digits `0,+1,−1` using carry to keep digits in {−1,0,+1}.
3. **Group Trits:** Chunk from most significant to least into:
   - 3-trit groups → Base27
   - 4-trit groups → Base81 (pad with leading zeros as needed)
   - 6-trit groups → Base729
4. **Map to Alphabet:** Use the ordering tables above to convert each group to its symbol.
5. **Padding/Alignment:** When input length is not divisible by the group size, left-pad with `0` trits; record original bit length in framing metadata when round-tripping exact byte counts matters.
6. **Error Handling:** Reject symbols outside the defined alphabets; for Base81 digraphs used as Base729 surrogates, enforce the `0–728` range and emit a contradiction flag (`−1`) for out-of-range pairs.

## Binary Compatibility Notes

- **Lossless decode:** The balanced-ternary conversion is reversible; carries are deterministic and do not alter numeric value.
- **Flag-friendly trits:** The `−1/0/+1` space can embed contradiction or integrity bits without leaving ternary space.
- **Interchange with Base64:** For interoperability, consider a shim where Base64 sextets are reinterpreted as 0–63 integers and lifted into balanced ternary blocks before symbol mapping, avoiding floating carries across block boundaries.

## Example Mapping (6 Trits → Base729 via Base27 pairs)

1. Trits: `[+1, −1, 0, +1, +1, −1]`
2. Value: \((+1)·3^5 + (−1)·3^4 + 0·3^3 + (+1)·3^2 + (+1)·3 + (−1) = 162 − 81 + 0 + 9 + 3 − 1 = 92\)
3. High digit: `92 // 27 = 3` (symbol `D`), low digit: `92 % 27 = 11` (symbol `L`)
4. Encoded pair: `DL`

## Integration with Coherence Formula

- **Contradiction channel:** Represent `δ_t` directly as a trit (−1, 0, +1); downstream modules can attach this trit alongside payload trits without widening the alphabet.
- **Normalization:** Because `|δ_t|` collapses sign, a single trit can both mark contradiction and participate in normalization without leaving ternary space.
- **Hash embedding:** PS-SHA∞ outputs can be rendered in Base729 for density while preserving explicit contradiction markers during aggregation.

## Implementation Checklist

- [ ] Reference encoder/decoder covering Base27/Base81/Base729
- [ ] Test vectors for binary round-trips and contradiction flag propagation
- [ ] Service-level framing that records bit-length for exact byte recovery
- [ ] Optional Unicode glyph map for Base729 when single-symbol density is required

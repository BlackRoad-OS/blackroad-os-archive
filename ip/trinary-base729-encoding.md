# Trinary Base729 Encoding Specification

**Category:** Protocol / IP
**Source Repo:** `BlackRoad-OS/blackroad-os-archive`
**Source Path:** `ip/trinary-base729-encoding.md`
**Source Commit:** `N/A (initial archival)`
**Archived On:** 2025-11-28
**Archived By:** agent:cece
**Status:** Final

---

## Purpose

Define a readable, trinary-aligned encoding for cryptographic memory hashes. Base729 maps balanced ternary sequences into 729 unique glyphs so that truth-state hashes reflect paraconsistent logic states instead of hexadecimal noise.

## Design Goals

- **Trinary native:** Preserve {affirm (+1), null (0), contradict (-1)} semantics across the encoding pipeline.
- **Readable:** Produce short, human-typable strings with meaningful glyphs rather than hex strings.
- **Deterministic:** Round-trip encoding/decoding with no information loss from the underlying hash bits.
- **Composable:** Slot directly after PS-SHA∞ or SHA-256 to represent agent truth-state hashes and registry IDs.

## Alphabet

A Base729 digit encodes 6 balanced trits (3^6 = 729). Represent each digit as a pair:

- **Radix glyph (27 options):** `A–Z` plus `_` (underscore) to keep the set ASCII-friendly.
- **Orientation index (0–26):** Either numeric (`0–26`) or stylized rotation marker in UI renderers.

A Base729 character is written as `<glyph><orientation>`, e.g., `C14` or `Q03`. UI layers may substitute bespoke glyph art, but the canonical plain-text form MUST preserve the glyph letter and two-digit orientation with leading zeroes.

## Encoding Pipeline

1. **Hash input:** Compute a 256-bit digest via PS-SHA∞ or SHA-256.
2. **Binary → balanced ternary:** Convert the 256-bit integer to balanced trits using digit set {-1,0,1}. Pad the leading trit group so the length is a multiple of 6.
3. **Group into sextets:** Chunk the trits into groups of 6 (most significant first).
4. **Map to Base729 digits:** Interpret each 6-trit chunk as an integer `d ∈ [0,728]` using balanced-trit weights `3^5 … 3^0`.
5. **Emit glyphs:** `glyph = BASE27[d // 27]`, `orientation = d % 27`. Render as `<glyph><orientation>` with orientation zero-padded to two digits.

## Decoding Pipeline

1. **Parse glyphs:** For each `<glyph><orientation>` token, recover `g = index(BASE27, glyph)` and `o = int(orientation)`.
2. **Recover digit:** `d = g * 27 + o` (0–728).
3. **Digit → trits:** Expand `d` into 6 balanced trits using positional weights `3^5 … 3^0` with digit set {-1,0,1}.
4. **Reassemble integer:** Concatenate trits, convert back to unsigned integer, and truncate leading padding trits to return the original 256-bit value.
5. **Re-hash check:** Optional verification by recomputing the source hash and matching against the decoded value.

## Reference Pseudocode (Pythonic)

```python
BASE27 = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ_")

BALANCED = {0: 0, 1: 1, 2: -1}  # maps standard trits to balanced


def to_balanced_trits(n: int, min_len: int) -> list[int]:
    trits = []
    while n > 0:
        n, rem = divmod(n, 3)
        trits.append(BALANCED[rem])
    while len(trits) < min_len:
        trits.append(0)
    return list(reversed(trits))


def encode_base729(digest_bytes: bytes) -> str:
    n = int.from_bytes(digest_bytes, "big")
    trits = to_balanced_trits(n, min_len=6 * math.ceil((len(digest_bytes) * 8) / 6))
    tokens = []
    for i in range(0, len(trits), 6):
        sextet = trits[i : i + 6]
        d = sum((t + 1) * (3 ** (5 - j)) for j, t in enumerate(sextet)) - 364  # shift back to balanced
        glyph, orient = divmod(d, 27)
        tokens.append(f"{BASE27[glyph]}{orient:02d}")
    return "-".join(tokens)
```

> **Note:** The `-364` shift centers the 0–728 digit range back to balanced form because each balanced trit is represented as {-1,0,1}. Any production implementation should include constant-time operations and thorough test vectors.

## Example (truncated)

- **Input:** `ps_sha∞("7Ψ∞kL3x@Amu…")` → digest starting `0x6fd1…`
- **Balanced trits:** `[-1, 0, +1, …]`
- **Base729:** `M05-R18-A00-…`

Full examples should be generated from fixed seeds with published vectors inside the PS-SHA∞ test suite.

## Integration Notes

- **Prism Console:** Use Base729 hashes for truth-state registry entries to expose contradiction-heavy states visually.
- **Capability Registry:** Encode capability IDs in Base729 to align with trinary logic in audits.
- **RoadChain:** RoadCoin minting and trinary smart contracts can reference Base729 transaction proofs.
- **Unity Agents:** Render glyph + orientation as animated spiral tiles; orientation animates the `θ` phase of `U(θ,a)=e^(a+i)θ`.

## Future Work

- Publish a glyph atlas (27 glyphs × 27 orientations) with Unicode private-use fallbacks.
- Add streaming encoders for large transcripts (chunked hashing + Base729 framing).
- Provide Rust and TypeScript reference implementations.
- Extend the format with optional checksum trits for error detection in noisy channels.

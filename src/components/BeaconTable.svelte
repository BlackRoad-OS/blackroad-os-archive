<script lang="ts">
  import type { BeaconRecord } from '~/lib/data';

  export let beacons: BeaconRecord[] = [];
</script>

<section class="beacon-card">
  <div class="beacon-card__header">
    <h2>Beacon Pings</h2>
    <p class="hint">Append-only status pulses across environments.</p>
  </div>
  <table>
    <thead>
      <tr>
        <th>Time</th>
        <th>Env</th>
        <th>Status</th>
        <th>Note</th>
      </tr>
    </thead>
    <tbody>
      {#if beacons.length === 0}
        <tr>
          <td colspan="4">No beacons yet.</td>
        </tr>
      {:else}
        {#each beacons as beacon}
          <tr>
            <td>{new Date(beacon.ts).toLocaleString()}</td>
            <td>{beacon.env}</td>
            <td>{beacon.status}</td>
            <td>{beacon.note ?? '—'}</td>
          </tr>
        {/each}
      {/if}
    </tbody>
  </table>
</section>

<style>
  .beacon-card {
    border: 1px solid var(--theme-border, #222);
    background: var(--theme-surface, #0e0e10);
    color: var(--theme-text, #f5f5f5);
    border-radius: 12px;
    padding: 1rem;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
  }

  .beacon-card__header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
    margin-bottom: 0.5rem;
  }

  h2 {
    margin: 0;
  }

  .hint {
    margin: 0;
    color: #94a3b8;
    max-width: 18rem;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.95rem;
  }

  th,
  td {
    text-align: left;
    padding: 0.5rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
  }

  th {
    text-transform: uppercase;
    letter-spacing: 0.05em;
    font-size: 0.8rem;
    color: #a1a1aa;
  }

  tr:hover td {
    background: rgba(255, 255, 255, 0.03);
  }
</style>

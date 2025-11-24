<script lang="ts">
  import type { DeployRecord } from '~/lib/data';

  export let deploys: DeployRecord[] = [];
</script>

<section class="timeline">
  <header>
    <div>
      <p class="eyebrow">Deploy Log</p>
      <h1>Immutable ship log</h1>
    </div>
    <p class="hint">Records are sorted newest first and committed to git.</p>
  </header>
  <ol>
    {#if deploys.length === 0}
      <li class="empty">No deploys recorded yet.</li>
    {:else}
      {#each deploys as deploy}
        <li>
          <div class="dot" aria-hidden="true"></div>
          <div class="meta">
            <p class="time">{new Date(deploy.ts).toLocaleString()}</p>
            <p class="msg">{deploy.msg}</p>
            {#if deploy.source}
              <p class="source">via {deploy.source}</p>
            {/if}
          </div>
        </li>
      {/each}
    {/if}
  </ol>
</section>

<style>
  .timeline {
    background: linear-gradient(135deg, #0b0b0e, #0f1119);
    border: 1px solid var(--theme-border, #222);
    border-radius: 12px;
    padding: 1rem 1.5rem;
    color: #f5f5f5;
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.35);
  }

  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
  }

  .eyebrow {
    margin: 0;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: #a1a1aa;
    font-size: 0.8rem;
  }

  h1 {
    margin: 0.2rem 0 0;
    font-size: 1.4rem;
  }

  .hint {
    margin: 0;
    color: #94a3b8;
    max-width: 18rem;
  }

  ol {
    list-style: none;
    padding: 0;
    margin: 1rem 0 0;
    position: relative;
  }

  ol::before {
    content: '';
    position: absolute;
    top: 0;
    left: 12px;
    width: 2px;
    height: 100%;
    background: rgba(255, 255, 255, 0.1);
  }

  li {
    display: grid;
    grid-template-columns: 24px 1fr;
    gap: 0.75rem;
    position: relative;
    padding-bottom: 1rem;
  }

  .dot {
    width: 12px;
    height: 12px;
    background: #22d3ee;
    border-radius: 999px;
    margin-top: 0.2rem;
    box-shadow: 0 0 0 4px rgba(34, 211, 238, 0.15);
  }

  .meta {
    background: rgba(255, 255, 255, 0.02);
    border: 1px solid rgba(255, 255, 255, 0.05);
    border-radius: 10px;
    padding: 0.75rem 1rem;
  }

  .time {
    margin: 0;
    color: #a1a1aa;
    font-size: 0.9rem;
  }

  .msg {
    margin: 0.1rem 0 0;
    font-size: 1rem;
  }

  .source {
    margin: 0.35rem 0 0;
    color: #cbd5e1;
    font-size: 0.9rem;
  }

  .empty {
    color: #94a3b8;
    padding-left: 0.6rem;
  }
</style>

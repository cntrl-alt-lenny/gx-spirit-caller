[//]: # (markdownlint-disable MD013 MD041)

# R&D r8 — the orchestration layer (2026-07-18)

**Method.** Brain-synthesized (Opus), grounded in three external best-practice
sweeps (multi-agent orchestration, effort-routing, handoff-verification — links
in §7), the r7 findings, and our own incident history (b576/b589 void work,
r6/r7 quota collisions, the b608 wine-lane spike). **Deliberately NOT a Claude
swarm:** four Claude/Codex worker lanes are live right now, and a Claude fan-out
would collide on the shared Claude Max quota — the *exact* failure r6 and r7 hit,
twice (banked in `feedback_session_patterns`). r8 is the **workflow /
orchestration layer**; it complements r7 (the technical decomp frontier), it does
not restate it.

## 0. Headline

Our composition is the **2026-standard supervisor pattern** (external default) and
is basically right: capable coordinator (Opus brain) + cheaper task-specific
workers (Sonnet 5 / Luna) is the shape that cuts cost 40–60% vs. all-flagship.
The leverage is **not a new topology** — it is three cheap disciplines we don't
yet enforce:

1. **Route *effort* per-brief, not per-agent.** A standing "Luna High / Sonnet
   Max" is the wrong unit; the same agent should run Medium on a gate-protected
   carve and High on an agentic engineering brief.
2. **Make the agent-handoff gate a *lint that runs before send*,** not only the
   3-region gate that runs at merge — kill the void-work class at the source.
3. **Keep the expensive fan-out (ultracode) at the brain ONLY.** Spreading it to
   workers multiplies the quota collision and buys nothing on gate-protected lanes.

## 1. Model + effort routing (answers the composition question)

The external consensus is sharp and matches our integrity posture exactly:
*higher effort is only worth it when it produces a measurable quality gain that
justifies 8× token cost + latency; Medium already reaches ~94% of High on
well-scoped work; reserve High/xhigh for genuine complexity that is async and
where the cost of a wrong answer is high.* Our gate makes the cost of a wrong
*ship* ≈ 0 (it can't merge), so effort on our lanes buys **throughput, not
correctness** — which flips the routing math toward *lower* effort wherever the
gate protects the output.

| Lane | Model | Effort | Why |
|---|---|---|---|
| **Brain** (this) | Opus 4.8 | High/Max, **ultracode for architecture/R&D** | Wide-leverage decisions; the one place fan-out pays. Fable when latency matters more than depth (triage, bookkeeping). |
| **CC Decomper** — mechanical carve / `.s`→C (gate-protected) | Sonnet 5 | **Max effort, NO ultracode** | Gate guarantees correctness; effort = throughput only. Ultracode would 8× cost for marginal ships **and** collide on quota. |
| **CC Scaffolder** — tool-building / judgment | Sonnet 5 | **Max effort, NO ultracode** | Real judgment lane → Max is justified. But fan-out belongs at the brain: hand the worker a spec, don't make it its own orchestrator. |
| **Codex Decomper/Scaffolder** — agentic engineering (610 naming, 611 retriever) | Luna | **High** | Genuinely complex, async, multi-step build-test-iterate → High is the justified tier (its 62.7% SWE-Bench-Pro strength). |
| **Codex** — mechanical `.s`→C / carve lanes | Luna | **Medium** | Routine gate-protected work; High buys nothing here (94% rule) and just burns the OpenAI budget. |

### Verdict on "should the CC workers swap to ultracode?" — **No.**

Three independent reasons, any one sufficient:

- **Quota collision.** Ultracode = each worker spawns its own sub-swarm.
  Two ultracode workers + the brain fan-out **blows the shared Claude Max
  limit** — the r6/r7 failure, structurally guaranteed rather than risked.
- **Gate economics.** The worker lanes are gate-protected (`gate3.py` /
  `batch_carve` containment). Correctness is already guaranteed by the gate, so
  ultracode's deliberation buys marginal throughput at ~8× cost. Our own posture
  (`feedback_opus48_integrity_posture`): on gate-protected mechanical work,
  model/effort choice = *throughput*, not *fewer wrong ships*.
- **Orchestrator-worker economics.** The 2026 pattern keeps *capable-model +
  fan-out at the coordinator*, workers lean — that's where the 40–60% saving
  comes from. Putting fan-out in the workers dilutes and duplicates the brain.

**Where ultracode *does* belong:** the brain, for exactly this kind of task
(architecture, R&D, cross-cutting refactors). And **per-task escalation**, never
a standing mode: when a *specific* worker task is genuinely hard (a reg-alloc
architecture problem, not a carve), bump that one brief to a higher tier — don't
raise the agent's floor.

**Net change to the composition:** keep it as-is (Opus brain / 2× Sonnet Max /
2× Luna High) — but treat "Luna High" and "Sonnet Max" as the *ceiling*, and
drop Codex to Medium on any mechanical brief. Encode this in the kickoff (§4).

## 2. The quota-collision structural fix (recurring r6/r7 failure)

The single most expensive *process* bug we have: R&D swarms share the user's
Claude Max quota with the live Claude worker agents, so a swarm launched during a
worker round starves the workers (or dies itself). Three levers, best-first:

1. **Time-slice R&D against worker rounds (do now, zero build).** Run Claude
   fan-out *only* when the Claude workers are idle (between review→kickoff). Make
   it a brain rule, not a hope. This r8 doc obeyed it (in-context, no swarm).
2. **Push R&D fan-out onto the OpenAI budget.** The Codex/Luna agents draw a
   *separate* quota. A research swarm authored as Codex briefs (or a workflow
   whose agents are Luna) does not touch the Claude limit at all. Best structural
   fix for "R&D while Claude workers run."
3. **Brain-only synthesis (fallback).** When neither holds, the brain does the
   R&D single-context (Opus is strong enough — this doc). Cheaper and collision-free,
   at the cost of breadth.

**Recommendation:** default to (1); when an R&D sweep is genuinely large, use
(2) — a Luna-agent research workflow — so it runs alongside live Claude workers.

## 3. Wall-clock utilization (the "Codex finishes in 8 minutes" pain)

Root cause was never capability — it was **task shape + effort tier**:
tool-and-paste checklists at Medium finish fast because there's nothing to
deliberate. The fix is a triad, all now in play:

- **Per-brief effort (§1)** — High on the agentic briefs extends wall-clock *and*
  adds the self-checking that Medium skips (the b576/b589 void class).
- **Agentic task shape** — "build tool X, unit-test it, run it, validate against a
  canary, iterate until the invariant holds" (SWE-Bench-Pro shape) spends real
  time and delivers leverage; "run tool, paste output" does neither. 610/611 are
  the first two briefs of this shape.
- **Standing playlists + attempt-cap 3** — keep a queue ≥2× drain depth so an
  agent never idles waiting on the brain (r7-6); cap retries at **3** then
  park+reassign (external: "kill and reassign after 3+ stuck iterations";
  r7-10 — the peer's 28 is infeasible on our lane count).

## 4. Void-work prevention: the handoff LINT (build this)

External finding, stated bluntly: *a hallucinated worker output that passes the
handoff becomes fact for the next layer; put a validation gate at every
inter-agent handoff.* We have the **merge** gate (`gate3.py`, 3-region sha1) —
the strongest possible. What we lack is the **pre-send** gate: the b576/b589
voids were kickoffs that shipped without a canary / with a wrong base, and the
cost surfaced only after a wasted agent-hour. r7-22 flagged this: make
CANARY / BASE-PREFLIGHT / paste-the-output a **lint on the kickoff text itself**.

`tools/kickoff_lint.py` (shipped alongside this doc, spec below) — the brain runs
it on every kickoff *before sending*:

- **PREFLIGHT present** — a `PREFLIGHT-OK`/`exit 1` guard that stops on a false
  premise (missing tool/base/dir) rather than producing void work.
- **CANARY present** — a first-batch check (`dsd check` / self-retrieval / sha1)
  that fails loud on the wrong-base / wrong-tool class before bulk work.
- **paste-the-output control** — the kickoff must demand a pasted tool-derived
  artifact (sha1 line, metric, `dsd check` green), never a self-report — the
  `feedback_opus48_integrity_posture` rule, mechanized.
- **worktree retry-loop** — the `git worktree add … || sleep 3` guard (the b602
  config-lock race fix) is present.
- **effort tag** — the brief names an explicit effort tier (§1), so Medium/High
  is a decision, not a default.

A kickoff that misses any of these is a *known* void-work risk; the lint turns
that from a post-hoc autopsy into a pre-send block. Deterministic, wine-free,
CI-safe.

## 5. Tool-build sequence (what to build, in order)

1. **`tools/kickoff_lint.py`** — this doc's deliverable; smallest, highest
   leverage (kills the void class). *Done here.*
2. **`tools/family_hit_harness.py`** — the ≥200-query retriever validation
   (r7-25). **In flight as brief 611 (PR #1177).** Gates all retriever-v2 work.
3. **`progress.py` honest-metric columns** (r7-16) — tractable-ceiling +
   attainment + done-class, so rate-of-progress is measured against the real
   ~14–24% target, not headline byte-%. Build-free dashboard; ~half a day.
4. **`tools/cmatch_loop.py`** (r7-2) — the production loop that *chains* the
   already-built pieces (retriever + fastmatch + batch_sha1) nothing currently
   composes. Unlocks once 611's harness proves the retriever lift. The big one.

## 6. Do-not-do (time-savers)

- **Don't ultracode the workers** (§1). Concentrate fan-out at the brain.
- **Don't launch a Claude R&D swarm during a live Claude worker round** (§2).
  Time-slice, or push it to the Luna/OpenAI budget.
- **Don't raise standing effort to fix wall-clock** — route per-brief (§3). A
  higher floor just 8×'s the cost of mechanical carves.
- **Don't add a topology** (debate/hierarchy/etc.). Supervisor is the right and
  sufficient pattern for a gate-arbitrated project; the wins are in discipline,
  not structure.

## 7. Sources

- Multi-agent orchestration patterns / supervisor-as-default:
  [digitalapplied](https://www.digitalapplied.com/blog/multi-agent-orchestration-5-patterns-that-work),
  [beam.ai](https://beam.ai/agentic-insights/multi-agent-orchestration-patterns-production),
  [Addy Osmani — Code Agent Orchestra](https://addyosmani.com/blog/code-agent-orchestra/)
- Effort routing (Medium ≈ 94% of High; reserve xhigh for async/high-stakes):
  [MindStudio — Claude effort levels](https://www.mindstudio.ai/blog/claude-code-effort-levels-explained),
  [AgentMarketCap — Codex xhigh vs standard](https://agentmarketcap.ai/blog/2026/04/08/openai-codex-xhigh-vs-standard-dual-tier-agent-strategy),
  [Augment — model routing guide](https://www.augmentcode.com/guides/ai-model-routing-guide)
- Handoff verification / bounded tasks / kill-after-3:
  [codebridge](https://www.codebridge.tech/articles/mastering-multi-agent-orchestration-coordination-is-the-new-scale-frontier),
  [ranksquire — production blueprint](https://ranksquire.com/2026/04/21/ai-agents-orchestration-2026/)

**Supersedes nothing in r7** (technical frontier stands). This is the process
companion: r7 says *what to build*, r8 says *how to run the agents that build it*.

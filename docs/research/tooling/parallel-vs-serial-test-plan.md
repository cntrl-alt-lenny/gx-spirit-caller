# Parallel-vs-serial lane experiment: test plan

**Question:** Does running two -j4 Codex agents concurrently in the same worktree clear a wave faster than one solo agent, once the optimal per-attempt loop (`verify.py` + batch sha1) is in place?

**Status:** Plan only. The brain/user runs this. No builds happen in this doc.

---

## Background

The campaign has historically run with one decomper agent ("Codex") per wave. The hypothesis is that a second concurrent agent could halve wall-clock time if the two agents' inner loops don't contend.

The key risk is sha1-gate serialization: `ninja sha1` writes `gx-spirit-caller_eur.nds` and `build/eur/arm9.o` — shared output paths. Two concurrent `ninja sha1` runs in the same worktree corrupt each other. With the optimal loop (`verify.py` per attempt, batch sha1 per batch), the only contention point is the sha1 gate, which runs infrequently.

The question is whether the parallelism gain in the `verify.py` inner loop outweighs the serialization overhead at the sha1 gate.

---

## Experiment design

### Fixed inputs

Select **20 known-tractable MED candidates** from `docs/research/c-match-prep/` that:
- Have dossiers already written (so the reshape direction is known)
- Are all in `src/overlay002/` (same module → same gap objects → same risk surface)
- Are independent of each other (no callee/caller relationship within the 20)
- Have no known "permuter-class" blocker (the dossier says "Try this" with a concrete first step)

Record the 20 addresses and their `docs/research/dossiers/<addr>.md` paths in a scratch file before the trial. Use the same 20 addresses for all conditions.

### Independent variables

| Label | Setup |
|-------|-------|
| **Condition S** (serial) | One Codex agent; processes all 20 candidates sequentially; `verify.py` per attempt; batch sha1 after every 5 confirms |
| **Condition P** (parallel) | Two Codex agents (Agent-A: candidates 1–10, Agent-B: candidates 11–20); `verify.py` per attempt (concurrent, different func names → safe); sha1 gate serialized (see protocol below) |

### Sha1 serialization protocol for Condition P

Use a plain file token: `build/eur/.sha1-lock`. Before running `ninja sha1`, each agent must:

```bash
# Spin-wait until the lock is free (check every 5 s):
while [ -f build/eur/.sha1-lock ]; do sleep 5; done
# Claim the lock:
echo $$ > build/eur/.sha1-lock
# Run the gate:
ninja sha1
# Release:
rm build/eur/.sha1-lock
```

This is a co-operative lock; it is safe only if both agents respect the protocol. The brain should verify both agents are using the same pattern before starting Condition P.

### Dependent variable (primary)

**Wall-clock time per confirmed match** = (time from wave-start to last `ninja sha1 PASS`) / (number of functions confirmed matched by sha1).

Record:
- `T_start` = time the first agent begins its first `verify.py` call
- `T_end` = time the last `ninja sha1` in the wave exits 0
- `N_confirmed` = count of functions with sha1 PASS (may be < 20 if some are walls)
- `metric = (T_end - T_start) / N_confirmed`

### Secondary measurements

- Total `verify.py` calls (reshape attempts) per condition — measures whether parallel changes the attempt rate
- Total `ninja sha1` calls — measures serialization pressure
- Number of sha1-lock wait events (Condition P only) — quantifies contention cost

### Controls

- Same machine, same OS version, same environment variables, both conditions run on the same day (to avoid hardware variance)
- No background builds, no other Codex agents active during the trial
- Same 20 candidates, same starting `.c` drafts (use the prep files from `docs/research/c-match-prep/` as the initial draft for each)
- Both conditions use the same `verify.py` + batch-sha1 inner loop (no bare `ninja` in either)
- Run each condition **3 times**, alternating S/P/S/P/S/P order to cancel warm-disk-cache effects

### Confound: wall-time skill variance

Two agents may produce the same .c more quickly or slowly depending on how long the Codex reasoning takes per candidate. This is noise in the experiment. Mitigate by:
- Pre-seeding each agent with the dossier content as context (the dossier has the concrete reshape step — this minimizes the exploration phase)
- If one agent finishes its half significantly faster than the other, record whether the split was even (10+10) or asymmetric

---

## Expected results and decision rule

### Predicted outcome (before running)

- `verify.py` inner loop: ~2–3 s per attempt, fully parallel → both agents run at full speed simultaneously → ~2× throughput during the inner loop
- sha1 gate: ~22 s per batch-of-5, serialized → one agent waits while the other holds the lock → contention ≈ (batch_size / attempts_per_func) × (sha1_time / 2) ≈ negligible if attempts_per_func >> 5
- Net prediction: Condition P should be **1.4–1.8× faster** than Condition S (not 2× because sha1 serialization eats some of the gain)

### Decision rule

| Outcome | Decision |
|---------|----------|
| Condition P is >20% faster (P metric < 0.8 × S metric) on ≥2/3 trials | Adopt dual-agent; document sha1-lock protocol in campaign briefs |
| Condition P is within ±20% of Condition S | Stay serial; complexity not worth marginal gain |
| Condition P is >20% slower | Investigate: sha1 lock waits > expected, or verify.py conflicts (check `/tmp/_verify_*` paths for naming collision) |

### Breaking ties

If the result is within ±20% but you want a finer answer: re-run with N=40 candidates and batch size 10. More candidates increases the sha1-gate serialization pressure and reveals whether the contention grows super-linearly.

---

## Candidate pre-screening checklist

Before starting the trial, confirm each of the 20 candidates:

```
[ ] addr is in docs/research/dossiers/<addr>.md
[ ] dossier says "Confidence: high" or the recipe is in Ov002EFRetriage.md
[ ] src/overlay002/func_ov002_<addr>.s exists
[ ] build/eur/delinks/_dsd_gap@overlay002_*.o contains func_ov002_<addr> (run: python tools/verify.py /dev/null func_ov002_<addr> --module overlay002 → expect EXIT 2 NOT-IN-GAP if already matched, EXIT 1 DIFF if still unmatched)
[ ] No candidate is a caller of another candidate in the same set
```

---

## Recording sheet template

```
Condition: [S / P]   Trial: [1 / 2 / 3]   Date:
T_start:
T_end:
N_confirmed:
Primary metric (s/confirm):

verify.py calls:
ninja sha1 calls:
sha1-lock waits (Cond P only):

Notes:
```

Fill one row per trial per condition. After 6 rows (3×S + 3×P), compute median metric for each condition and apply the decision rule.

[//]: # (markdownlint-disable MD013 MD041)

# Codex Decomper — autonomous work queue

**Protocol (the standing kickoff drives this — you don't need a new message per item):**
1. `python3.13 tools/queue.py next codex-decomper` → prints the next item, marks it CLAIMED. `QUEUE-EMPTY` → stop, ping the brain.
2. Do the item. Every symbol rename goes through `rename_symbol.py --cascade` and is gated with `scope_gate.py --kind naming` (the b610/b612 safety). Paste the real gate output — never self-report.
3. Open ONE PR. Then `python3.13 tools/queue.py done codex-decomper <id>`, commit the queue file, back to step 1.
4. ~3 failed attempts → `python3.13 tools/queue.py park codex-decomper <id> "<reason>"`, commit, continue.
5. Stop only on QUEUE-EMPTY, an ungreenable gate, or a real blocker. A short run because the queue drained is a SUCCESS.

You have the full toolchain in your worktree (`.codex/agents/decomper.toml`). Set effort HIGH. Naming is candidate-scarce right now — honest low counts per item are expected; process every item regardless.

---

### q-sig-refresh — re-run the sig-naming engine after new names land [DONE]
b630's sig-naming engine (dsd sig DB from named functions → `dsd sig apply` → `rename_symbol.py --cascade`) shipped 29 names. As the CC agents convert more functions to readable-C and name them, the sig corpus grows → more matches. Re-build the sig DB from ALL currently-named functions (EUR uniques + any newly named this session), re-apply across EUR/USA/JPN, report the delta vs 29. Canary: round-trip (un-name a known SDK function, sig-apply, recover the exact name) before any mass apply.
**Gate:** `dsd check` green 3 regions + `python3.13 tools/scope_gate.py --kind naming --base origin/main` PASS + names-applied delta vs b630's 29.

### q-name-crossprop — cross-region twin propagation sweep [DONE]
Any function real-named in EUR whose USA/JPN twin is still `func_*` is a free name (3× multiplier, byte-neutral). Sweep for EUR-only names, propagate each to its USA/JPN twin via `rename_symbol.py --cascade`, gated by `scope_gate.py --kind naming`. This is pure, safe yield.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + count of twins propagated.

### q-sig-lower-thresh — probe a lower sig-match threshold (measure precision) [TODO]
b630 applied only unambiguous sig matches. Investigate whether a lower `dsd sig apply` confidence threshold surfaces MORE correct names WITHOUT wrong ones — but the round-trip canary must stay 100% and scope_gate must pass every batch. If a lower threshold starts producing wrong names (round-trip fails / name at wrong address), STOP and record the precision ceiling — that's the valuable result. Do NOT mass-apply guesses.
**Gate:** `scope_gate.py --kind naming` PASS + a short precision report (threshold vs correct/wrong on the round-trip set).

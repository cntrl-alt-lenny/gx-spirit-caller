[//]: # (markdownlint-disable MD013 MD041)

# Codex Decomper — autonomous naming queue

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next codex-decomper`. Every rename via `rename_symbol.py --cascade`, each batch gated `scope_gate.py --kind naming` (b610/b612 safety). Paste real `dsd check` + `scope_gate` output. Open ONE PR, `work_queue.py done codex-decomper <id>`, commit, next. Effort HIGH. Naming is candidate-scarce — honest low counts / QUEUE-EMPTY quickly is a SUCCESS, not a failure; do NOT invent names.

---

### q-sig-refresh-2 — rebuild the sig DB after the CC agents named more functions [DONE]
The CC C-match rounds add real names as they convert functions. Rebuild b630's sig DB from ALL currently-named functions (it grows as C-match progresses), re-apply across EUR/USA/JPN, report the delta vs b630's 29. Round-trip canary first.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-2 — cross-region twin propagation [DONE]
Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade` (byte-neutral, 3× multiplier). Sweep all modules.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins propagated.

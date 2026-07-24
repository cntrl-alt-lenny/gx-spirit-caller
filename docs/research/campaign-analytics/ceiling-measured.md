[//]: # (markdownlint-disable MD013)

# Measured readable-C ceiling

This note supersedes the flat 10% asymptotic assumption in brief 615 and
records the R8 correction implemented in `tools/progress.py`.

| Module | Prior input | Current input | Basis |
|---|---:|---:|---|
| `main` | 10% | **75%** | R8 measured campaign rate: +33,832 C-bytes in the observed window, roughly 49% of the old model-assigned headroom in one month. |
| `ov002` | 10% | **10%** | Conservative policy dial retained: byte-complete, but its 1.1 MB readable-C conversion is selective rather than an exhausted technical wall. |
| All other modules | 75% | 75% | Existing finishable-tier input; unchanged. |

The formula remains:

```text
ceiling(module) = current_C + rate(module) * max(0, text_total - current_C)
```

The code now stores the asymptotic rates in an explicit per-module mapping,
so a future ov002 measurement can be changed independently. The rate is a
headroom estimate, not a claim that every remaining byte is readable C.

On the current committed-delinks snapshot, the EUR aggregate moves from
approximately **30.03%** of `.text` to **47.89%** when `main` changes from 10%
to 75%; the exact total is recomputed by `progress.py --by-module` from the
live delinks files. The small difference from the R8 headline 29.97% → 47.88%
is snapshot drift, not a new formula.

Validation:

```text
python -m pytest -q tests/test_progress.py
python tools/progress.py --version eur --by-module
```

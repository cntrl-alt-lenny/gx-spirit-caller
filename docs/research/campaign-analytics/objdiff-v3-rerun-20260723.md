# Objdiff v3 feasibility rerun — 2026-07-23

Queue item: `q-objdiff-v3`. The existing feasibility report remains the
authoritative no-go/conditional decision; this note records the reopened
queue item's current gate from `kb-types`.

- `python -m pytest -q tests`: **12 failed, 2,847 passed, 20 skipped, 55
  subtests**. The failures are the pre-existing Windows/path/tool-environment
  cases plus the generated research-index freshness check.
- `python tools/configure.py eur` completed, followed by the explicitly
  scoped `ninja sha1`; the original EUR SHA-1 was verified:

```text
Verifying SHA-1 of orig\baserom_eur.nds...
  OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
```

The objdiff pin remains unchanged. The item is parked until `q-green-pytest`
removes the baseline failures and makes the stated feasibility gate usable;
the v3 report-generation/direct-diff A/B probes remain a separate migration
trial.

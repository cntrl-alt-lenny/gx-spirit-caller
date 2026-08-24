[//]: # (markdownlint-disable MD013 MD041)

# Band ship-rates are vintage-stamped: every historical figure describes a pool that no longer exists

**Status:** brain finding, 2026-08-24 (round 0824 review). Derived from the live
`attempts.tsv` at `5d59cd34f`. Reproduce with the query in *Method* below.

## The observation

`cm-main-tier-sweep-7` and this week's two boundary experiments measured the
**same size band** with **completely disjoint candidate sets**, and disagree
totally:

| Band | sweep-7 (2026-08-17) | drain-2 + boundary-rerun (2026-08-22/24) |
|---|---|---|
| ≤192 B | 25/69 = **36.2%** | pool drained to 0 candidates |
| **193-256 B** | **8/29 = 27.6%** | **0/60 = 0.0%** |
| 257-320 B | 8/34 = **23.5%** | never tested |
| 321-376 B | 2/17 = 11.8% | never tested |
| >376 B | 0/2 = 0% | never tested |

**Address overlap between the two 193-256 B sets: zero.** These are not
re-attempts of the same functions. Same band, same `>=4 bl` filter, different
candidates, 27.6% → 0%.

## What it means

The campaign harvests in descending order of tractability. Every sweep takes the
candidates it can convert, and the ones it leaves behind are — by construction —
the ones it could not. A band's ship-rate is therefore **a property of the pool
at the moment it was measured**, not a property of the band. Quote it as the
latter and it will be wrong by the time anyone acts on it.

This is not a criticism of sweep-7: 27.6% was a true measurement of a real pool.
It simply stopped describing reality once that pool was picked over.

## Why it matters right now

`post-small-pool-strategy.md`'s Outcome B pre-staged a **257-512 B pilot**, and
the natural justification for it is sweep-7's 23.5% on 257-320 B. That figure is
the **same vintage** as the 27.6% which has now collapsed to zero on a disjoint
sample. Using it as a forecast would repeat, one band higher, the exact error
this table documents.

The pilot is still worth running — but as a test of *this* hypothesis, not as a
drain justified by a stale rate. `cm-main-band-followthrough` is scoped
accordingly: n=20 at 257-320 B, matched effort, with the cream-skimming
collapse stated as the prior and a kill criterion set in advance.

## The standing rule this produces

**Never quote a historical band/pool ship-rate as a forecast without re-deriving
it against the current unattempted population.** If the current population
cannot be sampled, say the figure is historical and name its vintage. The
campaign already has a tool discipline for this on pool *sizes*
(`pool_freshness.py`, and the `q-pool-freshness-tool` incident that produced
it); ship *rates* need the same scepticism and currently have none.

Related failure of the same shape: `cm-main-exploit-drain-2` Part 1 shipped
5/32 = 15.6% on the ≤192 B **tail**, against 73/100 = 73% on the same band's
fresh pool one round earlier — a 4.7× collapse from residue alone, recorded at
the time but not generalised.

## Method

```python
# rows = attempts.tsv; band by text_size; group by brief family
s7     = [r for r in rows if 'main-tier-sweep-7' in r['brief']]
recent = [r for r in rows if r['brief'].startswith(
              ('cm-main-exploit-drain-2', 'cm-main-boundary-rerun'))]
# then: ships/total per band, and the (module, addr) set intersection
```

Overlap check returned `0`, confirming disjoint populations.

## Cross-references

- [`post-small-pool-strategy.md`](post-small-pool-strategy.md) — the decision
  memo whose Outcome B this finding re-scopes.
- [`cm-main-boundary-rerun-2026-08-22.md`](cm-main-boundary-rerun-2026-08-22.md)
  — the 0/20 matched-effort result.
- [`cm-main-exploit-drain-1-2026-08-19.md`](cm-main-exploit-drain-1-2026-08-19.md)
  — the 73% fresh-pool round the tail later collapsed against.

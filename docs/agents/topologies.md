# Topologies

**The authority model is fixed. The topology is not.**

Every project using this framework has an Owner and a Brain, and at least one
executor. How many executors there are, what they are called, and whether there
is a standing Verifier, is a project decision — recorded once in the project's
own `AGENTS.md`, and never changed by which provider is being used this week.

All executors run the same [Worker contract](roles/worker.md). A specialist name
is that contract plus a scope statement. There is no separate contract per
specialist, which is why adding one changes nothing about acceptance, evidence,
isolation or merge rights.

## Choosing a starting topology

Start with the simplest one that works. Adding a role has a real cost:
dispatching it, reviewing its output, keeping its scope from overlapping.

### Sequential — research, data, documentation, small codebases

```
Owner
└── Brain
    └── Worker
```

One executor, one brief at a time. Brain reviews directly; there is no standing
Verifier. Use adversarial review as a Worker *mode* when a particular round
needs it.

Best when the work is sequential and research- or data-heavy, where the hard
part is judgement about evidence rather than volume of implementation.

*Evidence: a format-reconstruction project ran this topology successfully for
its entire life. The write-up is `framework/case-studies.md` in the framework
repository; it is that repository's history rather than any adopting project's,
so it is not copied.*

### High assurance — architecture, foundations, canonical data

```
Owner
└── Brain
    ├── Builder
    └── Verifier      (independent, does not see Builder's report first)
```

A triangle, not a chain. Both report to Brain independently, and neither sees
the other's conclusions before forming its own.

Use when the cost of a wrong acceptance is high and the project's real defects
are the kind that pass every local check.

*Evidence: on a project layering new code over an authoritative upstream engine,
independent exact-SHA review caught defects the author had missed on the first
round it was used.*

### Parallel specialists — genuinely independent workstreams

```
Owner
└── Brain
    ├── <Specialist A>
    └── <Specialist B>
```

Two executors with **disjoint scopes**, each in its own isolated checkout. Add a
lane only when:

- the workloads are genuinely independent;
- file ownership can be cleanly partitioned;
- shared tooling does not contend destructively;
- throughput data actually shows execution is the bottleneck.

*Evidence: a decompilation project ran two specialists — one matching functions,
one building tooling and research — and the parallelism materially increased
throughput because the responsibilities were genuinely distinct.*

### Combinations

Nothing stops a project running parallel specialists **and** a Verifier, or
adding a temporary specialist for one round. The rule is that a **standing** role
needs a demonstrated, recurring bottleneck. Temporary specialists dispatched for
one task are cheap and encouraged; they do not get a permanent seat.

> **Permanent roles are few; temporary dispatches are unlimited.**

## What a provider never does

**A provider never creates a lane.** These are all defects, not topologies:

<!-- guard:counterexample -->
<!-- guard:violation compound-lane roles=decomper text="Claude Decomper" -->
- `Claude Decomper` and `Codex Decomper` as two lanes — that is one Decomper,
  run twice.
<!-- guard:violation compound-lane roles=decomper text="Codex Decomper" -->
- A topology described as "two Claude workers plus two Codex workers".
<!-- guard:violation prefixed-lane roles=scaffolder text="codex-scaffolder" -->
- `codex-scaffolder` or `gemini-worker` as a queue or branch namespace.
<!-- guard:violation prefixed-lane roles=worker text="gemini-worker" -->
- A standing role created because a second tool was available.
<!-- /guard:counterexample -->

Occupying a role with a second tool does not produce a second role. Two
independent workstreams may justify two lanes; two vendors never do.

## Declaring the topology

A project declares its topology **once**, in its `AGENTS.md`, as a table of
roles with scopes. Everything else derives from it:

| Derived thing | Shape |
|---|---|
| Branch namespace | `<role>/<kebab-scope>` |
| Queue or brief ownership | keyed by role |
| Isolated checkout | one per concurrently-active role |
| Dispatch prompt | role + task + project state |

Because they are derived, changing which provider runs a role changes none of
them. If adoption enables the optional neutrality guard, that property is
checked by `tests/test_role_neutrality.py`, pointed at this project's own
declared role set. Adoption may explicitly defer that guard, so this document
does not claim that every adopting tree contains the test.

## Changing the topology

Adding or retiring a role is a **strategic decision**, so it goes to the owner.
Brain proposes it with the bottleneck evidence; the owner decides.

When a role is retired, move its row to a retired section with a one-line note
rather than deleting it. Old branches and archived queues carrying a retired
name are history, not drift — leave them alone, and mark archived queues
read-only so nobody mistakes them for live.

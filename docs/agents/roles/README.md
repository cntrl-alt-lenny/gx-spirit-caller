# Role contracts

Three contracts, defined once, in terms no tool or provider can invalidate:

- [**Brain**](brain.md) — required. Holds project context, sequences work,
  writes briefs, adjudicates, merges accepted work.
- [**Worker**](worker.md) — required, at least one. Executes one bounded brief.
- [**Verifier**](verifier.md) — optional. Independently reviews an exact SHA.

**These three are the whole normative vocabulary.** A project that wants
specialist executors does not write new contracts for them: a specialist is the
Worker contract plus a scope statement. See [`../topologies.md`](../topologies.md).

## Why only three contracts, when topology varies

What varies between projects is *how many executors there are and what they are
called*. What does not vary is *who may accept work*. Splitting those apart is
the point:

- The **authority model** is fixed by the [constitution](../CONSTITUTION.md) and
  is the same in every topology.
- The **topology** — one Worker, two specialists, a Verifier or not — is a
  project decision, recorded in the project's own `AGENTS.md`.

So a project with `Decomper` and `Scaffolder` has two Worker instances with
different scopes, not two new role definitions. Nothing about acceptance,
evidence, isolation or merge rights changes when it adds a third.

## Contract versus adapter

| | Contract | Adapter |
|---|---|---|
| Lives in | this directory | a provider-specific directory, e.g. `.claude/` |
| Says | what the role reads, may touch, must report, may never do | how to start it on one particular tool |
| Changes when | responsibilities change | a tool changes |
| Audience | any model, any tool, including unknown future ones | one tool |

**Test for whether something belongs here:** could a fresh model, on a tool this
project has never seen, be handed this file plus a brief and do the job? If a
sentence would leave it stuck, that sentence is an adapter detail.

Things that are therefore *not* in these files: model names, reasoning-effort
settings, frontmatter schemas, slash commands, hook mechanics, subagent dispatch
syntax, and anything named after a specific product version. Those belong in
[`../adapters.md`](../adapters.md) and the adapter itself.

If an adapter and a contract disagree, **the contract wins**.

## What must survive any provider substitution

These are properties of the repository and the process, not of any tool, and
they are what makes the framework portable:

- **Git carries the state.** Branches, exact SHAs, pull requests, CI results.
  Every role's inputs and outputs are addressable there.
- **Exact-SHA review.** A reviewer is given a literal base and head, and
  confirms ancestry itself.
- **Evidence is reproduced, not relayed.** Any role can re-run the project's
  validation commands.
- **The blind first pass.** A Verifier forms a verdict before reading the
  executor's narrative. That is a discipline, not a tool feature.
- **Reports are text.** A completion report or a review report is plain prose in
  a defined shape. A human can paste it if nothing automates the handoff.

## Capability requirements

Contracts state capabilities, never model names.

| Role | Needs |
|---|---|
| **Brain** | Repository access; shell and git; ability to run the project's validation; ability to inspect CI and external evidence; enough context to hold the architecture, a report, a review and live state at once. The work is adjudication, so this seat rewards a strong reasoning tier. |
| **Worker** | Filesystem access; git; shell; ability to run the validation relevant to its brief; faithful execution of a bounded scope without drift. |
| **Verifier** | Independent repository access; ability to check out and inspect an exact SHA; ability to re-run evidence. Write access to source is not needed and should not be used. |

> **A capability requirement, not a preference:** a browser-only chat assistant
> cannot hold the Worker or Verifier seat. It cannot create a branch, run the
> validation, or report a real SHA. Any provider's agentic tool with repository
> and shell access can. This is a statement about capability, never about
> vendor.

Which model actually ran a seat, and what was observed, belongs in a project's
own notes as a **log, not a ranking**. An adopting project keeps its durable
state in `docs/state.md`; the framework repository's author guidance is not
copied into the project.

## Conveniences must fail loudly

Some adapters add convenience: mirroring a session's final reply to a shared
location so Brain can read it without the owner relaying it, for example.

**Every such convenience needs a stated fallback, and its absence must mean
UNKNOWN — never "the task did not happen."** A round run on a tool without that
convenience writes nothing, and that is normal, not a signal. The fallbacks, in
order, are in the constitution under *Unknown means unknown*.

# Adapter specification

An **adapter** describes how to start a role on one particular tool. That is
all it does.

Adapters are optional. A project with no adapter at all is fully functional: the
[universal launch procedure](#the-universal-launch-procedure) works on every
tool, including one that does not exist yet.

## What an adapter may contain

- How to start a session on that tool, and where.
- That tool's configuration format — frontmatter, config files, manifests.
- Tool-specific conveniences: named agents, slash commands, hooks, transcript or
  inbox mechanisms, session APIs.
- Model and reasoning-effort settings, clearly marked as that tool's mechanics.
- A pointer to the canonical role contract.

## Where an adapter's files go

**An adapter's framework identifier is not its filesystem layout.** The name a
project types to ask for an adapter, and the directory the tool actually reads,
are two different facts. Every tool decides the second for itself: a dotted
directory, a plain one, a file at the repository root, or several places at
once. None of that is recoverable from a name.

So an adapter **declares** its layout, and nothing infers one. The declaration
states, at minimum, the destination directory; optionally, a mapping for the
files that belong somewhere else, and where its role seats live in the source.
An adapter with no declaration is an error — adoption stops rather than picking
a plausible-looking directory.

That last part is the load-bearing half. A wrong path that installs cleanly
looks exactly like a right one: the files exist, nothing errors, and the tool
silently reads nothing. A destination that is guessed is a destination nobody
checked. The framework repository implements this as an `adapter.json` beside
each adapter, loaded and validated by its `tools/adapters.py` and guarded by its
`tests/test_adapter_install_layout.py`. Neither of those is copied into an
adopting project: they are how the framework installs adapters, not something a
project runs.

Two things must then agree, and a test should hold them together:

- the destination the adapter documents, and the one it declares;
- every path an installed file refers to inside its own destination, and the
  files adoption actually wrote. A settings file wiring a hook by path is inert
  if that path is not where the hook landed, and inertness is silent.

## Seats are per contract, not per declared role name

An adapter ships one seat per **role contract** — the coordinating seat, the
executor seat, the reviewer seat where it has one. A project-declared specialist
executor is the executor contract plus a scope statement, not a second contract,
so it does not get a seat of its own: it is launched on the executor seat, and
its specialism comes from its scope in the project's coordination document and
from the brief.

An adapter is free to decide otherwise, but it must then say which it does and
be accurate about it. Claiming a file per declared role name that the installed
layout does not contain sends a cold session looking for a seat that is not
there — and any such generated seat would have to point at a role contract that
does not exist. Whatever the choice, adoption should report the seats it
actually installed rather than the ones a reader might infer.

## What an adapter may never contain

An adapter may not restate or redefine:

- **authority** — who may accept, reject, or merge;
- **role identity** — what the roles are and what they are called;
- **queue identity** — where work is tracked;
- **branch identity** — the branch namespace;
- **gates** — what must pass before work is accepted;
- **merge rights**.

Those live in the [constitution](CONSTITUTION.md) and the
[role contracts](roles/). **If an adapter and a contract disagree, the contract
wins.**

This is not a style rule. Every one of those, restated in an adapter, becomes a
second source of truth that drifts — and drifted silently in a real project until
a test caught a provider adapter still describing a superseded authority model
long after the contracts had moved on.

## Adapters point, they do not paraphrase

The correct shape of an adapter file is short:

```markdown
---
<whatever frontmatter this tool requires>
---

# <Role> — <tool> adapter

**Your role contract is [`<path to contract>`](<path>). Read it now, in full,
and follow it. It is authoritative.** This file exists only to start you on this
particular tool; it deliberately does not restate the contract, so the two
cannot drift apart.

Then read <the project's coordination document>.

## <Tool> specifics for this seat

- where to work
- how this seat is normally launched
- which of this tool's features apply, and which do not
```

Deliberately not restating the contract is the mechanism. A summary is a copy,
and copies drift.

## Conveniences must fail loudly

A convenience is anything the adapter provides that the framework does not
require: a hook mirroring a session's final reply somewhere Brain can read it, a
transcript API, an automatic worktree manager, a session registry.

Every convenience needs:

1. **A stated fallback** for when it is unavailable.
2. **An explicit statement that its absence means UNKNOWN.**

A round run on a different tool produces nothing from that convenience, and that
is *normal, not a signal*. Never interpret a missing artifact as "the task did
not happen", "the agent failed", or "the review did not run". Check the
timestamp before trusting an artifact that is there, too.

**A hook that captures a session's final reply is not this framework's only
route to that fact, and should not become a second one.** Every
filesystem-capable Worker and Verifier already writes its own completion
report into the shared inbox as part of its contract — see
[`reports.md`](reports.md). A convenience hook that also does this should call
the same writer rather than reimplementing the inbox location, the role tag,
or the write itself; two implementations of the same fact drift, the same way
a restated contract does. It remains a convenience — capturing the report
automatically, without the model needing to choose to run a command — layered
on a requirement that already holds without it.

## Prompts: neutral core, optional tail

The prompt Brain hands the owner is built from **role + task + project state**.
It must paste cleanly into any capable tool.

Tool-specific mechanics — restarting a session after a config change, a
particular flag, a slash command — go **after** the neutral core, in a clearly
marked optional block naming the tool:

```
OPTIONAL — <tool> only. Ignore if you are using something else.
<the mechanic>
```

An optional block may add launch mechanics and nothing else. It may not touch
the role, the queue, the branch, the gate, the authority, or the merge. When
adoption enables the optional neutrality guard, its installed test at
`tests/test_role_neutrality.py` checks this boundary against the project's own
declared roles. Adoption can explicitly defer that guard, so this document
does not claim that every adopting tree contains that test.

If the tool is unknown, the neutral core is still sufficient. That is the test of
whether the prompt was written correctly.

## The universal launch procedure

This works on every tool, including one this project has never seen. It is the
fallback whenever no adapter exists — which is the expected case for most tools.

1. **Put the session in the right checkout.** Brain in the primary checkout;
   every other concurrently-active role in its own — see
   [`git-and-isolation.md`](git-and-isolation.md).
2. **Give it the contract, in full**: the relevant file from
   [`roles/`](roles/). Paste it if the tool has no file access; the contracts are
   written to survive that.
3. **Give it the project's coordination and specification documents.**
4. **Give it its inputs.**
   - Worker: the brief and its branch.
   - Verifier: the brief, the literal base SHA, the literal head SHA — and
     **not** the executor's report.
   - Brain: nothing extra; it rehydrates from the repository.
5. **Take its report back as text.** Every role's output is prose in a defined
   shape. If nothing automates the handoff, the owner pastes it.

Nothing above depends on a provider. Everything an adapter adds is convenience on
top.

## Adding support for a new tool

1. Create a directory for that tool's configuration.
2. **Declare where its files belong**, per *Where an adapter's files go* above.
   Read it from the tool's own documentation; never assume it matches the
   directory name you just chose.
3. Add one thin adapter file per **role contract**, in the shape above — not one
   per role name a project happens to declare.
4. Add a row to the project's adapter table.
5. Change **nothing** in the role contracts, the branch convention, the queue, or
   the authority model. If supporting the tool seems to require that, the change
   belongs in the contract for a reason that has nothing to do with the tool —
   or it does not belong at all.

The framework repository ships an example adapter for one tool under its
`adapters/` directory. It is an illustration of the shape, not a dependency, and
the directory itself is never copied into a project — only the files it declares
are, at the destination it declares.

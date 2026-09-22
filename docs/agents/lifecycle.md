# The round

One unit of work, from "what's next?" to "here's what landed and here's the next
prompt".

## The loop

1. **Brain rehydrates** from the repository and live git state. Not from a
   previous conversation.
2. **Brain chooses the next coherent problem** and writes one bounded, complete
   brief.
3. **Brain hands the owner a ready-to-paste prompt.** Provider-neutral core; any
   tool-specific mechanics appended after it, marked optional.
4. **Owner chooses a tool or model and pastes the Builder prompt first.** Where
   the topology has a Verifier, Brain may provide its prompt in the same turn,
   but labels it to be sent only after the Builder has finished.
5. **Worker executes** in its own isolated checkout, commits, pushes its branch,
   and reports. The owner sends the Verifier prompt only after that Builder
   delivery; the Verifier does not wait or poll for it.
6. **Owner relays completion** if nothing automates it. If the mechanical check
   does not establish delivery in the Verifier's session, it says **"not
   delivered yet"** and the owner sends its prompt again once delivery is
   available.
7. **Verifier independently reviews the exact head SHA**, where the topology has
   one, without the executor's report on its first pass.
8. **Brain inspects the exact repository state** — literal SHAs, the real diff,
   real validation output, CI at that SHA.
9. **Brain adjudicates.** Reject with a corrective brief, or accept.
10. **On acceptance, Brain merges.**
11. **Brain summarizes in plain English** and updates durable state.
12. **Brain issues the next prompt.**

**The owner's involvement is steps 4, 6 and reading step 11.** Everything else
is the framework's job.

## What the owner actually experiences

> **Owner:** What's next?
>
> **Brain:** Last round added the schema validator and it's merged — the
> importer now rejects malformed records instead of silently dropping them. I
> re-ran the validator against the full dataset myself to confirm.
>
> Next is the export path, which has the same gap. Paste this into whichever
> tool you want to use:
>
> ```
> <complete self-contained prompt>
> ```

No SHAs, no branch names, no merge question.

## Brief lifecycle

A brief moves through five states. The state is written on the brief itself and
also encoded in where the file sits, so "what is in flight?" is answered by
listing a directory rather than reading carefully.

| Status | Lives in | Means |
|---|---|---|
| `queued` | the active file | Written, not started. |
| `active` | the active file | Being executed now. |
| `delivered` | `delivered/` | Execution finished and the work exists. **Not reviewed, not accepted.** |
| `accepted` | `archive/` | Reviewed, adjudicated, merged. |
| `rejected` | `archive/` | Adjudicated and not merged. The record is kept — rejected rounds are the more informative half of this directory. |

### Why `delivered` is its own state

It was originally two states, and that was wrong. A brief that was delivered but
not adjudicated had to be moved aside to free the active file for the next one —
which made `archive/` mean two incompatible things at once: *completed history*
and *temporarily parked while still under review*. A cold session listing the
archive would have counted an unreviewed round as finished.

The underlying cause is that **the pipeline is genuinely concurrent and the
original lifecycle was written as if it were linear.**

### Rounds pipeline

A Worker may start round N+1 while round N is still waiting on review. That is
the normal case, not an exception. Two constraints come with it:

- **`archive/` means adjudicated.** Never park an unreviewed round there to free
  up the active slot.
- **Never queue a brief whose correctness depends on an unadjudicated round.**
  If a review might overturn round N's finding, round N+1 must not build on it.
  Rescope, or wait.

### Naming and archiving

```
<NNN>-<YYYY-MM-DD>-<slug>.md
```

Zero-padded sequence number first, then the date, then a short slug. The number
is the primary sort key — dates alone stop disambiguating once two rounds land
on the same day. The number is assigned when the brief is written and never
changes as the file moves.

Archive the brief **as it was actually received**. If Brain amended it mid-round,
append the amendment rather than editing the original text: a brief silently
improved after the fact is useless as evidence about how the round really went.
The outcome is appended when it moves to the archive.

## Handoff protocol

The prompt Brain hands over is the entire interface. It must be **complete and
self-contained**, because the session receiving it has no conversation history:

- the working directory to start in;
- which files to read before acting — the coordination document, the role
  contract, the brief;
- the task, its scope and its non-scope;
- the protected invariants;
- what validation to run;
- the report contract.

It must **not** contain provider-specific mechanics in its core. If the chosen
tool needs something special, it goes after the neutral core, clearly marked as
optional and naming the tool. If the tool is unknown, the neutral core is still
sufficient — that is the test of whether the prompt was written correctly.

## When a report does not arrive

A missing report artifact means **UNKNOWN**. Not "the task did not happen", not
"the agent failed", not "the review did not run".

1. Check the shared completion-report inbox — see [`reports.md`](reports.md).
   Every filesystem-capable Worker and Verifier writes there before ending its
   turn, regardless of which tool ran it, so this now answers the question for
   any provider, not only one with a convenience hook installed. Check the
   report's recorded head SHA against the checkout's current HEAD before
   trusting it — `python3 tools/report.py status` does this.
2. Ask the owner to paste the report, if nothing automates the handoff.
3. Inspect repository and pull-request state directly — the branch, the diff,
   the commits, CI at that exact SHA. This works everywhere and is what the
   framework actually relies on.
4. Where none of the above can answer, **ask the owner** rather than inferring.

Step 3 can confirm that execution happened, because execution leaves a branch
and a diff whether or not anyone relayed a report. It **cannot** confirm that a
review happened: a finished review produces no diff, no commit and no pull
request — only a report, which is exactly the thing a missing artifact means is
unknown. There is no repository-state proxy for that, so do not invent one. Step
1 closes most of that gap without needing a human relay at all, but it is still
a report, not repository state, and still subject to the same evidence
discipline as any other one.

## Corrective rounds

A rejected round goes back as a **corrective brief to a fresh context**, with
neutral framing. Never hand an agent its own rejected reasoning back to defend —
it will defend it.

State what was found, not who found it. The corrective brief is a new problem
statement, not an appeal hearing.

The problem-not-solution rule applies to adjudication corrections too. If Brain
must prescribe wording to preserve a constraint, it checks all corrections as
one set, literally and together, before handing them back; contradictory
corrections must be reconciled rather than passed to the executor.

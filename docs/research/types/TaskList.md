[//]: # (markdownlint-disable MD013 MD041)

# TaskList

Simple flat task / object list. Stores a count and a pointer to an array of
`void *` task objects. Used as an alternative to the intrusive linked-list
pattern for groups of objects that are enumerated sequentially.

## Confidence: HIGH

Confirmed by matched C file `func_0200b06c.c`; typedef with named `count` +
`tasks` fields; pointer-to-array subscript pattern `p->tasks[i]` observed.

## C Definition

```c
typedef struct TaskList {
    int     count; /* +0x00  number of tasks in the array */
    void  **tasks; /* +0x04  pointer to array of task object pointers */
} TaskList;        /* sizeof = 0x08 */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | s32 | r/w | func_0200b06c (`p->count`) |
| 0x04 | ptr | r/w | func_0200b06c (`p->tasks`) |

Array subscript usage: `p->tasks[i]` — the array pointer is valid at runtime.

## Using functions

- `func_0200b06c` — iterates `p->tasks[0..p->count-1]`, likely calling each
  task function pointer or dispatching per entry

## Notes

VARNAME `ctx` (46 files) also accesses `count`, `array` fields alongside
`f8`, `f_74`, `f_78`, `f_b0`, `fc`, `fe`, `flag` — suggesting a larger context
struct that *embeds* or *references* a TaskList. The TaskList itself is the
8-byte base form; larger orchestrator structs wrap it.

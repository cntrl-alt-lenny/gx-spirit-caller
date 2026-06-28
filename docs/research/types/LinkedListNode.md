[//]: # (markdownlint-disable MD013 MD041)

# LinkedListNode

Singly-linked list node with an integer key. Used throughout the main ARM9
code as a generic intrusive list (the node is embedded in or pointed to by
the payload object). Also appears in a variant form (see below) used for
function-callback dispatch tables.

## Confidence: HIGH

Confirmed by matched C file `func_0200fd84.c` (typed `Node *`; self-referential
`next` + `key` fields). VARNAME stats show `node` (28 files, 78 lines) and
`cur`/`head` (12-13 files each) with `next`, `key`, `f0`, `f4` fields.

## C Definition

```c
typedef struct Node {
    struct Node *next; /* +0x00  pointer to next node (NULL = tail) */
    int          pad;  /* +0x04  padding / unused */
    int          key;  /* +0x08  sort key or payload integer */
} Node;                /* sizeof = 0x0C */
```

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00 | ptr | r/w | func_0200fd84 (`n->next`) |
| 0x08 | s32 | read | func_0200fd84 (`n->key`) |

Pattern also confirmed by `cur`/`head` VARNAME data: `cur->next`, `cur->prev`,
`cur->key` (though `prev` suggests a doubly-linked variant at same layout
but with a prev pointer at 0x04 instead of pad).

## Doubly-linked variant

VARNAME stats for `cur` (12 files) show fields `next` AND `prev`, implying
some lists are doubly-linked. Layout is likely:

```c
typedef struct DListNode {
    struct DListNode *next; /* +0x00 */
    struct DListNode *prev; /* +0x04 */
    int               key;  /* +0x08 */
} DListNode;                /* sizeof = 0x0C */
```

## Dispatch-table variant (`node` VARNAME, 28 files)

The `node` variable (78 lines, 28 files) accesses fields `fn`, `dtor`, `obj`,
`f0`, `f4`, `f10`, `f14`, `key`, `arg`, `next` — suggesting a richer node
type used for callback / task dispatch:

```c
typedef struct DispatchNode {
    struct DispatchNode *next; /* +0x00 */
    void               *obj;  /* +0x04  owning object */
    void               *fn;   /* +0x08  callback function pointer */
    void               *dtor; /* +0x0C  destructor */
    int                 key;  /* +0x10  priority or ID */
    void               *arg;  /* +0x14  argument */
} DispatchNode;                /* minimum sizeof = 0x18 */
```

## Using functions

- `func_0200fd84` — linked-list traversal using `Node *n`; `n->next`, `n->key`
- `func_0200b06c` — uses `task_list_t` (count + `void **tasks`), the
  flat-array analogue to this intrusive list
- VARNAME `head`/`cur` pattern (12–13 files each): list iteration loops

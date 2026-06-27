/* CAMPAIGN-PREP candidate for func_020320f8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     exact store-order incl field0=0 mid-block; stack-arg d/e/f via [sp]; mvn=-1 wrap guard
 *   risk:       struct-guessed: 0x24 alloc size + field map inferred; args a,b are strh (short). Risk store-order: orig writes field0=0 AFTER field20; if mwcc sinks the zero-init it reorders str. Confirm Obj/Node layout.
 *   confidence: low
 */
typedef struct Obj {
    /* 0x00 */ unsigned int field0;
    /* 0x04 */ struct Node *field4;
    /* 0x08 */ struct Node *field8;
    /* 0x0c */ struct Node *fieldc;
} Obj;

typedef struct Node {
    /* 0x00 */ struct Node *field0;
    /* 0x04 */ struct Node *field4;
    /* 0x08 */ unsigned int field8;
    /* 0x0c */ short fieldc;
    /* 0x0e */ short fielde;
    /* 0x10 */ int field10;
    /* 0x14 */ int field14;
    /* 0x18 */ int field18;
    /* 0x1c */ int field1c;
    /* 0x20 */ int field20;
} Node;

extern void *func_02032028(Obj *obj, int size);

int func_020320f8(Obj *obj, short a, short b, int c, int d, int e, int f)
{
    Node *n;
    int prev;

    if (obj == 0)
        return -1;
    n = (Node *)func_02032028(obj, 0x24);
    if (n == 0)
        return -1;
    n->field8 = obj->field0;
    n->fieldc = a;
    n->fielde = b;
    n->field10 = c;
    n->field14 = 0;
    n->field18 = d;
    n->field1c = e;
    n->field20 = f;
    n->field0 = 0;
    n->field4 = (Node *)obj->field8;
    if (obj->field8 != 0)
        obj->field8->field0 = n;
    obj->field8 = n;
    if ((Node **)&obj->fieldc != 0) {
        if (obj->fieldc == 0)
            obj->fieldc = n;
    }
    prev = (int)obj->field0;
    prev = prev + 1;
    obj->field0 = (unsigned int)prev;
    if (prev == -1)
        obj->field0 = (unsigned int)(prev + 1);
    return (int)n->field8;
}

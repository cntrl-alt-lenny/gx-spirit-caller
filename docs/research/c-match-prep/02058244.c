/* CAMPAIGN-PREP candidate for func_02058244 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r9=key movs-tested; r8=base; liveness head=r7/tail=r6/prev=r5/next=r4; conditional strne/streq pairs at L_224
 *   risk:       L_224 epilogue reuses r7(head)/r6(tail) into BOTH the head!=0 and ==0 arms via streq/strne sharing one cmp; mwcc may split into two compares. Reg-rotation across r4-r7 likely off → permuter-class. Offsets struct-guessed.
 *   confidence: low
 */
#include "nitro/types.h"

extern void func_02058334(void *o, void *node);

typedef struct Node {
    u8   _pad0[0xc];
    s32  fc;             /* 0xc  */
    s32  f10;            /* 0x10 */
    struct Node *f14;    /* 0x14 -> next */
} Node;

typedef struct Base {
    u8   _pad0[0x438];
    struct Node *head;   /* 0x438 */
    struct Node *tail;   /* 0x43c */
} Base;

typedef struct Obj {
    Base *p;             /* 0x0 */
} Obj;

s32 func_02058244(Obj *o, s32 key)
{
    Base *b = o->p;

    if (key != 0) {
        Node *cur;
        Node *head;
        Node *tail;
        Node *prev;
        Node *next;

        head = b->head;
        tail = b->tail;
        prev = 0;
        b->head = 0;
        b->tail = 0;
        cur = head;
        while (cur != 0) {
            next = cur->f14;
            if (cur->f10 == (s32)key || cur->fc == 1) {
                if (prev != 0) {
                    prev->f14 = next;
                } else {
                    head = next;
                }
                if (tail == cur) {
                    tail = prev;
                }
                func_02058334(o, cur);
            } else {
                prev = cur;
            }
            cur = next;
        }
        if (b->head != 0) {
            b->tail->f14 = head;
            b->tail = tail;
        } else {
            b->head = head;
            b->tail = tail;
        }
        return 0;
    } else {
        Node *cur = b->head;
        if (cur != 0) {
            do {
                Node *next;
                b->head = 0;
                b->tail = 0;
                while (cur != 0) {
                    next = cur->f14;
                    func_02058334(o, cur);
                    cur = next;
                }
                cur = b->head;
            } while (b->head != 0);
        }
        return 0;
    }
}

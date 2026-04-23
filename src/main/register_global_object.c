/* __register_global_object: CodeWarrior dtor-chain registrar.
 *
 *     ldr r3, .L_020b4310          ; r3 = &g_dtor_head
 *     ldr ip, [r3, #0x0]            ; ip = *g_dtor_head = old head
 *     str ip, [r2, #0x0]            ; node->next = old_head
 *     str r1, [r2, #0x4]            ; node->dtor = dtor
 *     str r0, [r2, #0x8]            ; node->obj  = obj
 *     str r2, [r3, #0x0]            ; *g_dtor_head = node
 *     bx lr
 * .L_020b4310: .word data_021aa480
 *
 * 7 ARM instructions + 1 literal-pool word = 32 bytes = 0x20. ✓
 *
 * Called by every `__sinit_*` shell as the final step of static
 * global initialization — takes the constructed obj, a dtor to run
 * at exit, and a 12-byte scratch node, and prepends the node to
 * the global dtor list at `data_021aa480`.
 *
 * Node layout (12 bytes):
 *   0x00: next (pointer to previous head)
 *   0x04: dtor (void (*)(void *))
 *   0x08: obj  (void *)
 *
 * Signature already declared in libs/runtime/include/runtime/sinit.h
 * as the `#include <runtime/sinit.h>` target of every `__sinit_*.c`.
 */

struct dtor_node {
    struct dtor_node *next;
    void (*dtor)(void *obj);
    void *obj;
};

extern struct dtor_node *data_021aa480;

void __register_global_object(void *obj, void (*dtor)(void *obj), void *chain_slot) {
    struct dtor_node *node = (struct dtor_node *)chain_slot;
    node->next = data_021aa480;
    node->dtor = dtor;
    node->obj = obj;
    data_021aa480 = node;
}

/* func_ov010_021b2af8: C-42 — two-call thunk with pool-loaded data-pointer args.
 *
 * Orig shape (32 B, 6 ARM insns + 2 pool words):
 *
 *     push  {r3, lr}
 *     ldr   r0, [pc, #12]             ; r0 = &data_ov010_021b8be4 (pool reloc)
 *     bl    func_0207f79c             ; helper1(&data_ov010_021b8be4)
 *     ldr   r0, [pc, #8]              ; r0 = &data_ov010_021b8bd0
 *     bl    func_0207f774             ; helper2(&data_ov010_021b8bd0)
 *     pop   {r3, pc}
 *     .word data_ov010_021b8be4
 *     .word data_ov010_021b8bd0
 *
 * Brief 237 C-42 — two helpers each taking an external data-symbol
 * pointer (BSS data). mwcc pool-loads the addresses + emits sequential
 * calls. Natural recipe: `helper1(data1); helper2(data2);`.
 *
 * See `func_ov002_021b0b54.c` for the recipe rationale.
 */

extern int func_0207f79c(void *arg);
extern int func_0207f774(void *arg);
extern char data_ov010_021b8be4[];
extern char data_ov010_021b8bd0[];

void func_ov010_021b2af8(void) {
    func_0207f79c(data_ov010_021b8be4);
    func_0207f774(data_ov010_021b8bd0);
}

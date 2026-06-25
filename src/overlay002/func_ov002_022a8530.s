; func_ov002_022a8530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc364
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_ov002_022a8530
        .arm
func_ov002_022a8530:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    add r0, sp, #0x28
    bl func_02091554
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    ldr r2, _LIT1
    mvn r1, #0x0
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x0
    str r4, [sp]
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cc364
_LIT1: .word 0x0000c980

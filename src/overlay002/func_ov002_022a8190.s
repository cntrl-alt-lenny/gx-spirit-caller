; func_ov002_022a8190 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc310
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .global func_ov002_022a8190
        .arm
func_ov002_022a8190:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    ldr r2, [r0, #0x5e4]
    cmp r1, r2
    addne sp, sp, #0x28
    ldmneia sp!, {r4, pc}
    sub r1, r2, #0x1
    str r1, [r0, #0x5e4]
    mvn r1, #0xf
    str r1, [r0, #0x5e8]
    ldr r0, _LIT0
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
    strh r3, [sp, #0x14]
    str r4, [sp]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    mov r0, #0x36
    sub r1, r0, #0x37
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cc310
_LIT1: .word 0x0000b980

; func_ov002_022861bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern func_ov002_0227b084
        .extern func_ov002_0227b8c8
        .extern func_ov002_02286000
        .global func_ov002_022861bc
        .arm
func_ov002_022861bc:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r4, r3
    ldr r3, [sp, #0x44]
    ldr ip, _LIT0
    mov r6, r0
    mov r5, r1
    str r6, [ip]
    bl func_ov002_0227b8c8
    mvn r1, #0x0
    cmp r0, r1
    addne sp, sp, #0x30
    ldmneia sp!, {r4, r5, r6, pc}
    add ip, sp, #0x4
    ldr r3, [sp, #0x40]
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str ip, [sp]
    bl func_ov002_02286000
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    mov r0, r6
    bl func_ov002_0227b084
    mvn r1, #0x0
    cmp r0, r1
    addne sp, sp, #0x30
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    movle r0, #0x1
    movgt r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444

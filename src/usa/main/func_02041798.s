; func_02041798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe824
        .extern data_020fe878
        .extern func_02041460
        .extern func_0209150c
        .extern func_020aace8
        .global func_02041798
        .arm
func_02041798:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    add r0, r7, #0x1000
    ldr r1, [r0, #0x8]
    ldr r0, _LIT0
    cmp r1, #0x0
    ldreq r6, _LIT1
    add r5, r7, r0
    add r0, r7, #0x1000
    ldrne r6, _LIT2
    ldr r0, [r0, #0x124]
    bl func_020aace8
    mov r4, r0
    mov r0, r6
    bl func_020aace8
    add r1, r7, #0x1000
    mov r8, r0
    ldr r0, [r1, #0x128]
    bl func_020aace8
    sub r1, r8, #0x4
    add r0, r1, r0
    add r1, r4, r0
    ldr r0, _LIT0
    add r2, r1, #0x400
    add r1, r7, r0
    mov r0, r7
    bl func_02041460
    cmp r0, #0x1
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    add r3, r7, #0x1000
    ldr r0, [r3, #0x124]
    mov r2, r6
    str r0, [sp]
    ldr r0, [r5, #0x4]
    ldr r1, [r5, #0xc]
    ldr r3, [r3, #0x128]
    bl func_0209150c
    ldr r1, [r5, #0x4]
    add r0, r1, r0
    str r0, [r5, #0x4]
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000019f4
_LIT1: .word data_020fe824
_LIT2: .word data_020fe878

; func_0206b2a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101cd0
        .extern data_02101d18
        .extern data_02101d38
        .extern data_02101d48
        .extern data_0219e310
        .extern func_020552ac
        .extern func_020552bc
        .extern func_02068b94
        .extern func_0206a2a0
        .extern func_0206b4f4
        .extern func_020a6c60
        .extern func_020a985c
        .extern func_020aad04
        .global func_0206b2a8
        .arm
func_0206b2a8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x11c
    bl func_020a6c60
.L_30:
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    bne .L_50
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_50:
    mov r1, #0x1
    mov r0, r7
    str r1, [r7]
    bl func_0206b4f4
    mov r0, r7
    bl func_02068b94
    mov r1, r6
    add r0, r7, #0xc
    bl func_020aad04
    mov r1, r5
    add r0, r7, #0x30
    bl func_020aad04
    mov r1, r4
    add r0, r7, #0x54
    bl func_020aad04
    ldr r0, [sp, #0x20]
    mov r2, #0x0
    str r0, [r7, #0x488]
    cmp r0, #0x0
    str r2, [r7, #0x48c]
    bne .L_b4
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    bl func_020a6c60
.L_b4:
    ldr r0, [sp, #0x24]
    ldr r1, _LIT5
    str r0, [r7, #0x494]
    str r1, [r7, #0x498]
    mov r3, #0x0
    str r3, [r7, #0x4a0]
    mvn r0, #0x0
    str r0, [r7, #0x4b0]
    str r3, [r7, #0x7c]
    str r3, [r7, #0x80]
    str r3, [r7, #0x8]
    str r0, [r7, #0x484]
    str r3, [r7, #0x480]
    ldr r2, [sp, #0x18]
    str r3, [r7, #0x4a4]
    mov r0, r7
    str r2, [r7, #0x4b8]
    bl func_0206a2a0
    mov r0, #0x0
    str r0, [r7, #0x5cc]
    bl func_020552bc
    bl func_020a985c
    bl func_020552ac
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101d38
_LIT1: .word data_02101cd0
_LIT2: .word data_0219e310
_LIT3: .word data_02101d48
_LIT4: .word 0x00000132
_LIT5: .word data_02101d18

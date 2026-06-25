; func_020a3148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9770
        .extern func_020a2c04
        .extern func_020a2ea8
        .extern func_020a2ed8
        .extern func_020a3050
        .extern func_020a309c
        .global func_020a3148
        .arm
func_020a3148:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    ldr r4, _LIT0
.L_c4:
    ldrb r0, [r4, #0xc]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_c4
    b .L_f0
    b .L_f0
    b .L_108
    b .L_110
    b .L_12c
    b .L_134
    b .L_c4
.L_f0:
    bl func_020a309c
    cmp r0, #0x0
    bne .L_c4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_108:
    bl func_020a3050
    b .L_c4
.L_110:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020a2ed8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_12c:
    bl func_020a2ea8
    b .L_c4
.L_134:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_020a2c04
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a9770

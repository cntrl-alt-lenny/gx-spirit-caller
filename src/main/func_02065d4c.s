; func_02065d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054ec0
        .extern func_02054f44
        .global func_02065d4c
        .arm
func_02065d4c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, #0x0
    bl func_02054f44
    movs r6, r0
    addeq sp, sp, #0x4
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r4, _LIT0
    mov r7, r5
.L_fc4:
    ldr r0, [r6, #0xc]
    ldr r0, [r0, r7, lsl #0x2]
    cmp r0, #0x0
    beq .L_1000
    ldr r1, [r0]
    cmp r1, r4
    beq .L_ff8
    mov r5, r1
    bl func_02054ec0
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_ff8:
    add r7, r7, #0x1
    b .L_fc4
.L_1000:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x0100007f

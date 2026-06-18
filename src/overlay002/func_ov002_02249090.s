; func_ov002_02249090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202df78
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_02249090
        .arm
func_ov002_02249090:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r2, _LIT0
    mov r8, r0
    cmp r1, r2
    beq .L_24
    add r0, r2, #0xac
    cmp r1, r0
    ldreq r5, _LIT1
    b .L_28
.L_24:
    ldr r5, _LIT2
.L_28:
    ldr r0, _LIT3
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT4
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT5
    mov r9, #0xd
    add r7, r0, r1
    add r6, r7, #0x260
.L_58:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202df78
    cmp r0, #0x0
    beq .L_9c
    mov r0, r8
    mov r1, sl
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_9c
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253458
.L_9c:
    ldr r0, [r7, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_58
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00001232
_LIT1: .word 0x00000fc9
_LIT2: .word 0x00001117
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf17c
_LIT5: .word data_ov002_022cf16c

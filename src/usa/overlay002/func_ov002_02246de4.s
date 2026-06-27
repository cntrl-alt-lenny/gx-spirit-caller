; func_ov002_02246de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cabc0
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021bd77c
        .global func_ov002_02246de4
        .arm
func_ov002_02246de4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r8, r1
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_84
    ldr r0, _LIT2
    ldr r4, _LIT3
    add r7, r0, r2
    add r6, r7, #0x120
    mvn r9, #0x0
.L_3c:
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r6]
    mov r0, r0, lsl #0x13
    mov r1, r1, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r1, lsr #0x13
    mov r0, r1, lsr #0x13
    bne .L_70
    mov r1, r9
    bl func_ov002_021bd77c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_70:
    ldr r0, [r7, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_3c
.L_84:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cabc0

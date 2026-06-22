; func_ov002_0220d094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf288
        .extern func_ov002_0226eb5c
        .global func_ov002_0220d094
        .arm
func_ov002_0220d094:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrh r3, [r0, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r3, lsl #0x11
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsr #0x1f
    eor r5, r2, r3, lsr #0x1f
    and r3, r5, #0x1
    mul r2, r3, r0
    ldr r0, [r1, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r7, #0x1
    add r9, r0, r2
    mov r8, #0x3e8
    mov r4, r7
    mov fp, #0x0
.L_54:
    ldr r0, [r9]
    cmp r0, r8
    ble .L_cc
    ldr r0, [r9, #0xc]
    mov r6, fp
    cmp r0, #0x0
    bls .L_bc
    add sl, r9, #0x120
.L_74:
    ldr r3, [sl]
    mov r0, r5
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r1, r3, lsl #0x12
    mov ip, r2, lsl #0x1
    mov r2, r4
    mov r3, r7
    add r1, ip, r1, lsr #0x1f
    bl func_ov002_0226eb5c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r9, #0xc]
    add r6, r6, #0x1
    cmp r6, r0
    add sl, sl, #0x4
    bcc .L_74
.L_bc:
    add r7, r7, #0x1
    cmp r7, #0x3
    add r8, r8, #0x3e8
    ble .L_54
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf288
_LIT2: .word data_ov002_022cf16c

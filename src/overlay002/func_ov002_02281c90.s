; func_ov002_02281c90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021ba5e0
        .extern func_ov002_021ba654
        .global func_ov002_02281c90
        .arm
func_ov002_02281c90:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    ldr r0, _LIT0
    and r2, fp, #0x1
    mul r1, r2, r0
    mov r5, #0x0
    ldr r0, _LIT1
    mov r6, r5
    ldr r0, [r0, r1]
    mov r7, r5
    mov r4, r5
    cmp r0, #0x0
    bls .L_1c0
    ldr r0, _LIT2
    add sl, r0, r1
    add r0, sl, #0x18
    add r9, r0, #0x400
.L_178:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    addne r5, r5, #0x1
    bne .L_1ac
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x16
    addeq r6, r6, #0x1
    addne r7, r7, #0x1
.L_1ac:
    ldr r0, [sl, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r9, r9, #0x4
    bcc .L_178
.L_1c0:
    cmp r6, r5
    ble .L_1e8
    cmp r6, r7
    blt .L_1e8
    mov r0, fp
    mov r1, #0x16
    bl func_ov002_021ba654
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    cmp r7, r5
    bgt .L_200
    mov r0, fp
    bl func_ov002_021ba5e0
    cmp r0, #0x0
    bne .L_208
.L_200:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_208:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c

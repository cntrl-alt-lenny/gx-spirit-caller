; func_ov002_022b35d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022ccb38
        .extern data_ov002_022ccb3c
        .extern data_ov002_022ccb44
        .extern data_ov002_022ccb64
        .extern data_ov002_022ccb6c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d738
        .extern func_02091554
        .extern func_02094550
        .global func_ov002_022b35d8
        .arm
func_ov002_022b35d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0xb88]
    cmp r0, #0x3
    bne .L_1d8
    cmp r1, #0x1
    beq .L_1c4
    cmp r1, #0x2
    cmpne r1, #0x3
    ldreq r2, _LIT1
    b .L_1c8
.L_1c4:
    ldr r2, _LIT2
.L_1c8:
    ldr r1, _LIT3
    add r0, sp, #0x0
    bl func_02091554
    b .L_20c
.L_1d8:
    cmp r1, #0x1
    beq .L_1f4
    cmp r1, #0x2
    beq .L_1fc
    cmp r1, #0x3
    ldreq r2, _LIT4
    b .L_200
.L_1f4:
    ldr r2, _LIT2
    b .L_200
.L_1fc:
    ldr r2, _LIT1
.L_200:
    ldr r1, _LIT5
    add r0, sp, #0x0
    bl func_02091554
.L_20c:
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov fp, r0
    bl func_0201d738
    mov r6, #0x0
    mov r8, r0
    mov r9, r6
    mov r4, #0x80
    mov r5, r6
.L_238:
    mov r7, r5
    mov sl, r6
.L_240:
    add r0, r7, r9
    mov r0, r0, lsl #0x7
    add r0, r0, #0x6400000
    add r1, r0, #0x780
    mov r2, r4
    add r0, r8, sl, lsl #0x7
    add r1, r1, #0x4000
    bl func_02094550
    add r7, r7, #0x1
    cmp r7, #0x7
    add sl, sl, #0xc
    blt .L_240
    add r6, r6, #0x1
    cmp r6, #0xc
    add r9, r9, #0x7
    blt .L_238
    mov r0, fp
    bl func_02006e1c
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_021040ac
_LIT1: .word data_ov002_022ccb3c
_LIT2: .word data_ov002_022ccb38
_LIT3: .word data_ov002_022ccb44
_LIT4: .word data_ov002_022ccb64
_LIT5: .word data_ov002_022ccb6c

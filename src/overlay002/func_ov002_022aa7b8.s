; func_ov002_022aa7b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022cc154
        .extern data_ov002_022cc37c
        .extern data_ov002_022cc39c
        .extern data_ov002_022cc3bc
        .extern data_ov002_022d016c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208e1ac
        .extern func_0208e200
        .extern func_02091554
        .extern func_02094688
        .extern func_ov002_022aab4c
        .global func_ov002_022aa7b8
        .arm
func_ov002_022aa7b8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x6e0
    ldr r1, _LIT0
    mov r3, #0x31
    ldr r4, [r1, #0xb84]
    ldr r1, _LIT1
    ldr r5, _LIT2
    umull r1, r6, r4, r1
    mov r6, r6, lsr #0x4
    umull r1, r2, r3, r6
    sub r6, r4, r1
    ldr r2, _LIT3
    mov r1, #0x0
    ldr r4, [r2, r6, lsl #0x2]
    sub r2, r5, #0xa
    str r1, [r5]
    ldrh r1, [r2]
    mov r6, r0
    add r0, sp, #0xb0
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x1d80
    strh r1, [r2]
    bl func_0201d47c
    ldr r1, _LIT4
    add r0, sp, #0x90
    mov r2, r4
    bl func_02091554
    add r0, sp, #0x90
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    add r5, sp, #0xd8
    ldrh r2, [sp, #0xc4]
    str r0, [sp, #0xb0]
    ldr r1, [sp, #0xc8]
    bic r0, r2, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0xc4]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x4000
    ldrh r2, [sp, #0xc4]
    str r0, [sp, #0xc8]
    str r5, [sp, #0xb8]
    orr r0, r2, #0x10
    strh r0, [sp, #0xc4]
    mov r0, #0x27c0
    str r0, [sp, #0xbc]
    mov r0, #0xa00
    strh r0, [sp, #0xc0]
    add r0, sp, #0xb0
    bl func_0201e5b8
    ldr r0, [sp, #0xb0]
    bl func_02006e1c
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    tst r0, #0x2
    beq .L_c38
    bl func_0208e1ac
    mov r1, r0
    add r0, sp, #0x158
    mov r2, #0x580
    bl func_02094688
    bl func_0208e1ac
    mov r1, r0
    mov r0, r5
    add r1, r1, #0x580
    mov r2, #0x80
    bl func_02094688
    b .L_c4c
.L_c38:
    bl func_0208e1ac
    mov r1, r0
    mov r0, r5
    mov r2, #0x600
    bl func_02094688
.L_c4c:
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0]
    sub r1, r0, #0x8
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x1c80
    strh r0, [r1]
    bl func_0208e200
    add r0, sp, #0x68
    bl func_0201d47c
    ldr r1, _LIT7
    add r0, sp, #0x48
    mov r2, r4
    bl func_02091554
    add r0, sp, #0x48
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x7c]
    ldr r3, _LIT8
    ldr r1, [sp, #0x80]
    bic r2, r2, #0xf
    orr r2, r2, #0x5
    strh r2, [sp, #0x7c]
    ldrh r2, [sp, #0x7c]
    str r0, [sp, #0x68]
    str r5, [sp, #0x70]
    orr r0, r2, #0x10
    bic r2, r1, #0x1c000
    mov r1, #0xc00
    strh r0, [sp, #0x7c]
    add r0, sp, #0x68
    str r3, [sp, #0x74]
    str r2, [sp, #0x80]
    strh r1, [sp, #0x78]
    bl func_0201e5b8
    ldr r0, [sp, #0x68]
    bl func_02006e1c
    mov r2, #0x0
    add r0, sp, #0x600
    strh r2, [r0, #0xdc]
    strh r2, [r0, #0xda]
    ldr r1, _LIT5
    strh r2, [r0, #0xd8]
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1b
    mov r4, r0, lsr #0x1e
    tst r4, #0x2
    beq .L_d90
    bl func_0208e200
    mov r2, r4, lsr #0x1f
    rsb r1, r2, r4, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    add r1, r1, r1, lsl #0x1
    add r2, r1, #0x40
    add r3, sp, #0xd8
    mov r1, r0
    add r0, r3, r2, lsl #0x1
    mov r2, #0x580
    bl func_02094688
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r4, r0, lsr #0x1e
    bl func_0208e200
    mov r2, r4, lsr #0x1f
    rsb r1, r2, r4, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    mov r3, r0
    add r0, r1, r1, lsl #0x1
    add r2, sp, #0xd8
    add r0, r2, r0, lsl #0x1
    add r1, r3, #0x580
    mov r2, #0x80
    bl func_02094688
    b .L_db8
.L_d90:
    bl func_0208e200
    mov r2, r4, lsr #0x1f
    rsb r1, r2, r4, lsl #0x1f
    add r1, r2, r1, ror #0x1f
    add r2, r1, r1, lsl #0x1
    add r3, sp, #0xd8
    mov r1, r0
    add r0, r3, r2, lsl #0x1
    mov r2, #0x600
    bl func_02094688
.L_db8:
    ldr r1, _LIT9
    mov r0, r6
    ldr r1, [r1, #0xdc]
    bl func_ov002_022aab4c
    ldr r3, _LIT10
    ldr r0, _LIT5
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0x3
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    ldr r1, [r0, #0x4]
    add r0, sp, #0x28
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1e
    mov r3, r1, lsr #0x1f
    rsb r2, r3, r1, lsl #0x1f
    ldr r1, _LIT11
    add r2, r3, r2, ror #0x1f
    bl func_02091554
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    ldr r2, _LIT12
    mov r1, #0x180
    bic r0, r0, #0xf
    orr r3, r0, #0x9
    add r0, sp, #0x0
    str r4, [sp]
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    add sp, sp, #0x6e0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021040ac
_LIT1: .word 0x5397829d
_LIT2: .word 0x04001014
_LIT3: .word data_ov002_022cc154
_LIT4: .word data_ov002_022cc37c
_LIT5: .word data_02104f4c
_LIT6: .word 0x04001010
_LIT7: .word data_ov002_022cc39c
_LIT8: .word 0x000077c0
_LIT9: .word data_ov002_022d016c
_LIT10: .word 0x04001000
_LIT11: .word data_ov002_022cc3bc
_LIT12: .word 0x00008780

; func_ov002_021b12bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021af9d0
        .extern func_ov002_02258168
        .extern func_ov002_022582b4
        .extern func_ov002_02258384
        .extern func_ov002_022583b4
        .extern func_ov002_022584ac
        .extern func_ov002_02258500
        .extern func_ov002_022585dc
        .extern func_ov002_02271a78
        .global func_ov002_021b12bc
        .arm
func_ov002_021b12bc:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd64]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_14c
    b .L_14c
    b .L_128
    b .L_98
    b .L_ac
    b .L_84
    b .L_54
    b .L_5c
    b .L_70
    b .L_44
    b .L_44
    b .L_120
.L_44:
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov002_022584ac
    ldmia sp!, {r3, pc}
.L_54:
    bl func_ov002_02258384
    ldmia sp!, {r3, pc}
.L_5c:
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1
    bl func_ov002_02271a78
    ldmia sp!, {r3, pc}
.L_70:
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_ov002_022583b4
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl func_ov002_02271a78
    ldmia sp!, {r3, pc}
.L_98:
    mov r0, #0x1
    mov r1, r0
    mov r2, #0x0
    bl func_ov002_02271a78
    ldmia sp!, {r3, pc}
.L_ac:
    ldr r2, [r0, #0xd74]
    sub r1, r2, #0xb
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_114
    b .L_d4
    b .L_104
    b .L_104
    b .L_104
    b .L_104
.L_d4:
    ldr r0, [r0, #0xd5c]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_f0
    mov r0, #0x0
    bl func_ov002_022582b4
    ldmia sp!, {r3, pc}
.L_f0:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_ov002_022583b4
    ldmia sp!, {r3, pc}
.L_104:
    ldr r1, [r0, #0xd70]
    mov r0, #0x0
    bl func_ov002_02258500
    ldmia sp!, {r3, pc}
.L_114:
    mov r0, #0x0
    bl func_ov002_02258168
    ldmia sp!, {r3, pc}
.L_120:
    bl func_ov002_022585dc
    ldmia sp!, {r3, pc}
.L_128:
    ldr r3, [r0, #0xd74]
    ldr r0, [r0, #0xd70]
    sub r1, r3, #0xb
    mvn r2, #0x0
    bl func_ov002_021af9d0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, pc}
.L_14c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd50]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c

; func_ov014_021b2fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02102c90
        .extern data_ov014_021b4c08
        .extern data_ov014_021b4d90
        .extern data_ov014_021b4da4
        .extern data_ov014_021b4dc0
        .extern data_ov014_021b4de0
        .extern data_ov014_021b4dfc
        .extern data_ov014_021b4e18
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_0202c0c0
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .extern func_02094550
        .extern func_ov014_021b3938
        .global func_ov014_021b2fb8
        .arm
func_ov014_021b2fb8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    mov r5, r0
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x3c]
    mov r3, #0x0
    str r0, [sp, #0x28]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    mov r1, #0x20
    add r0, sp, #0x28
    bic r2, r2, #0x10
    str r3, [sp, #0x34]
    strh r2, [sp, #0x3c]
    strh r1, [sp, #0x38]
    str r3, [sp, #0x30]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    bl func_0208e0a0
    mov ip, #0x0
    add r3, r0, #0x42
    mov r4, #0x14
    mov r2, ip
.L_148:
    mov lr, r2
.L_14c:
    add r0, r4, #0x1
    mov r1, lr, lsl #0x1
    add lr, lr, #0x1
    mov r0, r0, lsl #0x10
    strh r4, [r3, r1]
    cmp lr, #0x14
    mov r4, r0, lsr #0x10
    blt .L_14c
    add ip, ip, #0x1
    cmp ip, #0x5
    add r3, r3, #0x40
    blt .L_148
    bl func_0208de4c
    mov r4, r0
    add r1, r4, #0x280
    mov r0, #0x0
    mov r2, #0xc80
    bl func_02094504
    ldr r0, _LIT1
    mov r1, #0x14
    mov r2, #0x5
    bl func_02001d0c
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r1, r0
    mov r3, #0x4
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    add r2, r4, #0x280
    bl func_02004f58
    ldrsb r0, [r5, #0xc]
    cmp r0, #0x0
    beq .L_210
    add r0, r5, #0xc
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0xa0
    add r3, r0, r0, lsr #0x1f
    mov r1, #0x14
    str r1, [sp]
    mov ip, #0xc
    ldr r0, _LIT1
    add r1, r5, #0xc
    add r2, r4, #0x280
    mov r3, r3, asr #0x1
    str ip, [sp, #0x4]
    bl func_02004f58
.L_210:
    bl func_0208e0a0
    add r0, r0, #0xc2
    mov r3, #0x0
    add ip, r0, #0x100
    mov lr, #0x78
    mov r2, r3
.L_228:
    mov r4, r2
.L_22c:
    add r0, lr, #0x1
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    strh lr, [ip, r1]
    cmp r4, #0x14
    mov lr, r0, lsr #0x10
    blt .L_22c
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x40
    blt .L_228
    mov r0, r5
    mov r1, #0x0
    bl func_ov014_021b3938
    bl func_0208e0a0
    add r0, r0, #0x42
    mov r3, #0x0
    add ip, r0, #0x300
    mov lr, #0xdc
    mov r2, r3
.L_280:
    mov r4, r2
.L_284:
    add r0, lr, #0x1
    mov r1, r4, lsl #0x1
    add r4, r4, #0x1
    mov r0, r0, lsl #0x10
    strh lr, [ip, r1]
    cmp r4, #0x14
    mov lr, r0, lsr #0x10
    blt .L_284
    add r3, r3, #0x1
    cmp r3, #0x5
    add ip, ip, #0x40
    blt .L_280
    mov r0, r5
    mov r1, #0x1
    bl func_ov014_021b3938
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r2, #0x40
    sub r1, r2, #0x41
    ldrh r3, [sp, #0x3c]
    str r0, [sp, #0x28]
    strh r2, [sp, #0x38]
    bic r0, r3, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x3c]
    mov r3, #0x2800
    ldrh r0, [sp, #0x3c]
    str r3, [sp, #0x34]
    str r1, [sp, #0x30]
    bic r3, r0, #0x10
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x3000
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0x20
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, #0x20
    bl func_02094550
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    ldrh r0, [sp, #0x3c]
    mov r1, #0x0
    str r1, [sp, #0x34]
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    ldrh r0, [sp, #0x3c]
    bic r0, r0, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x1000
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mvn r0, #0x0
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x1800
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mvn r0, #0x0
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    ldr r0, _LIT10
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r1, r4
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r5, #0x44
    str r0, [sp, #0x14]
    add r0, r5, #0x38
    add r1, r5, #0x3c
    add r2, r5, #0x40
    mov r3, #0x3c00
    bl func_0201ef90
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1c00
    str r1, [r2]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov014_021b4d90
_LIT1: .word data_02102c90
_LIT2: .word 0x000006a5
_LIT3: .word data_ov014_021b4da4
_LIT4: .word data_ov014_021b4dc0
_LIT5: .word data_020b4728
_LIT6: .word 0x05000460
_LIT7: .word data_ov014_021b4de0
_LIT8: .word data_ov014_021b4dfc
_LIT9: .word data_ov014_021b4e18
_LIT10: .word data_ov014_021b4c08

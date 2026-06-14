; func_ov019_021b2ae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov019_021b5a18
        .extern data_ov019_021b5bd0
        .extern data_ov019_021b5bf0
        .extern data_ov019_021b5c0c
        .extern data_ov019_021b5c2c
        .extern data_ov019_021b5c4c
        .extern data_ov019_021b5e70
        .extern data_ov019_021b6848
        .extern data_ov019_021b6920
        .extern func_02001bc8
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_0202c0c0
        .extern func_0208c884
        .extern func_02094504
        .extern func_02094550
        .extern func_ov019_021b3f7c
        .extern func_ov019_021b40d4
        .extern func_ov019_021b4258
        .extern func_ov019_021b52f0
        .global func_ov019_021b2ae8
        .arm
func_ov019_021b2ae8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x70
    ldr r1, _LIT0
    mov r6, r0
    ldr r2, _LIT1
    mov r0, #0x0
    bl func_02094504
    ldr r0, _LIT2
    mvn r1, #0xf
    bl func_0208c884
    ldr r0, _LIT3
    mvn r1, #0xf
    bl func_0208c884
    mov r0, r6
    bl func_ov019_021b3f7c
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x48]
    mov r0, #0x40
    ldrh r1, [sp, #0x5c]
    str r0, [sp, #0x54]
    bic r0, r1, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x5c]
    mov r0, #0x0
    ldrh r1, [sp, #0x5c]
    strh r0, [sp, #0x58]
    orr r0, r1, #0x10
    ldr r1, [sp, #0x60]
    strh r0, [sp, #0x5c]
    bic r1, r1, #0x1c000
    orr r1, r1, #0xc000
    add r0, sp, #0x48
    str r1, [sp, #0x60]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    ble .L_1c4
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x5c]
    ldr r1, [sp, #0x60]
    str r0, [sp, #0x48]
    bic r0, r1, #0x1c000
    bic r2, r2, #0xf
    orr r1, r2, #0x2
    orr r0, r0, #0x8000
    strh r1, [sp, #0x5c]
    bic r0, r0, #0x7f
    orr r0, r0, #0xd
    ldrh r2, [sp, #0x5c]
    bic r0, r0, #0x3f80
    orr r1, r0, #0x180
    orr r3, r2, #0x10
    mov r4, #0x4d00
    mov r2, #0x200
    add r0, sp, #0x48
    str r1, [sp, #0x60]
    str r4, [sp, #0x54]
    strh r3, [sp, #0x5c]
    strh r2, [sp, #0x58]
    bl func_0201e5b8
    ldr r0, [sp, #0x60]
    ldrh r1, [sp, #0x5e]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x1c000
    orr r2, r1, #0x8000
    bic r0, r0, #0x3f80
    orr r1, r0, #0x400
    add r0, sp, #0x48
    strh r2, [sp, #0x5e]
    str r1, [sp, #0x60]
    bl func_0201e5b8
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT6
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, _LIT7
    str r0, [sp, #0x48]
    mov r0, #0x200
    str r1, [sp, #0x54]
    ldr r1, [sp, #0x60]
    ldrh r2, [sp, #0x5c]
    strh r0, [sp, #0x58]
    bic r1, r1, #0x1c000
    bic r0, r2, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x5c]
    orr r1, r1, #0x1c000
    ldrh r2, [sp, #0x5c]
    bic r1, r1, #0x7f
    orr r1, r1, #0xd
    bic r1, r1, #0x3f80
    orr r2, r2, #0x10
    orr r1, r1, #0x680
    add r0, sp, #0x48
    strh r2, [sp, #0x5c]
    str r1, [sp, #0x60]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
.L_1c4:
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x5c]
    str r0, [sp, #0x48]
    mov r4, #0x40
    bic r0, r2, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x5c]
    ldr r1, [sp, #0x60]
    ldrh r2, [sp, #0x5c]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    orr r3, r2, #0x10
    mov r2, #0x0
    add r0, sp, #0x48
    str r4, [sp, #0x54]
    strh r3, [sp, #0x5c]
    strh r2, [sp, #0x58]
    str r1, [sp, #0x60]
    bl func_0201e5b8
    ldr r0, [sp, #0x48]
    bl func_02006e1c
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    ble .L_338
    add r0, sp, #0x48
    bl func_0201d47c
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x6e]
    ldrh r3, [sp, #0x5c]
    ldr r4, [sp, #0x60]
    bic r1, r1, #0xff
    bic r3, r3, #0xf
    orr r1, r1, #0x1c
    orr r3, r3, #0x7
    strh r3, [sp, #0x5c]
    ldrh r5, [sp, #0x5c]
    bic r4, r4, #0x1c000
    orr r4, r4, #0x8000
    orr r7, r5, #0x10
    mov r8, #0x3780
    mov r5, #0x200
    str r8, [sp, #0x54]
    strh r7, [sp, #0x5c]
    strh r5, [sp, #0x58]
    str r4, [sp, #0x60]
    ldrh r2, [sp, #0x6c]
    strh r1, [sp, #0x6e]
    str r0, [sp, #0x48]
    bic r1, r2, #0xff
    strh r1, [sp, #0x6c]
    ldrh r2, [sp, #0x6e]
    ldrh r3, [sp, #0x6c]
    ldrh r1, [sp, #0x5e]
    bic r2, r2, #0xff00
    bic r3, r3, #0xff00
    orr r2, r2, #0x300
    orr r1, r1, #0x4000
    strh r3, [sp, #0x6c]
    strh r2, [sp, #0x6e]
    strh r1, [sp, #0x5e]
    mov r4, #0x0
    mov r5, #0x1
    mov r7, #0x6
    add r8, sp, #0x48
    b .L_324
.L_2e8:
    cmp r4, #0x0
    ble .L_300
    ldr r0, [sp, #0x60]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x60]
.L_300:
    ldr r1, [sp, #0x60]
    mov r0, r5, lsl #0x19
    bic r1, r1, #0x3f80
    orr r1, r1, r0, lsr #0x12
    mov r0, r8
    str r1, [sp, #0x60]
    bl func_0201e5b8
    add r5, r5, #0x3
    add r4, r4, #0x1
.L_324:
    ldr r0, [r6, #0x8]
    cmp r0, #0x6
    movgt r0, r7
    cmp r4, r0
    blt .L_2e8
.L_338:
    ldr r0, _LIT10
    add r4, sp, #0x38
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r3, #0x0
    add r1, r6, #0x44
    add r2, r6, #0x48
    str r3, [sp]
    mov r4, #0x2
    add r0, r6, #0xbc
    str r4, [sp, #0x4]
    add r5, sp, #0x38
    add r4, r0, #0x400
    str r5, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r6, #0x440
    add r1, r1, #0x400
    add r2, r2, #0x400
    str r4, [sp, #0x14]
    bl func_0201ef90
    ldr r2, _LIT11
    add r0, sp, #0x18
    mov r1, #0x2800
    bl func_02001bc8
    ldr r1, _LIT12
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT13
    add r0, sp, #0x18
    mov r1, #0x2800
    bl func_02001bc8
    ldr r1, _LIT14
    add r0, sp, #0x18
    mov r2, #0x20
    bl func_02094550
    ldr r0, [r6, #0x8]
    cmp r0, #0x6
    ble .L_428
    mov r7, r6
    mov r5, #0x0
    mov r4, #0x6
    b .L_40c
.L_3f4:
    ldrh r1, [r7, #0x14]
    mov r0, r6
    mov r2, r5
    bl func_ov019_021b40d4
    add r7, r7, #0xc
    add r5, r5, #0x1
.L_40c:
    ldr r0, [r6, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    add r0, r0, #0x1
    cmp r5, r0
    blt .L_3f4
    b .L_46c
.L_428:
    cmp r0, #0x0
    ble .L_46c
    mov r7, r6
    mov r5, #0x0
    mov r4, #0x6
    b .L_458
.L_440:
    ldrh r1, [r7, #0x14]
    mov r0, r6
    mov r2, r5
    bl func_ov019_021b40d4
    add r7, r7, #0xc
    add r5, r5, #0x1
.L_458:
    ldr r0, [r6, #0x8]
    cmp r0, #0x6
    movgt r0, r4
    cmp r5, r0
    blt .L_440
.L_46c:
    mov r0, r6
    bl func_ov019_021b4258
    mov r3, #0x4000000
    ldr r0, [r3]
    add r2, r3, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0xc00
    str r0, [r3]
    ldr r1, [r2]
    mov r0, #0x130
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1c00
    str r1, [r2]
    str r0, [r3, #0x14]
    str r0, [r3, #0x18]
    ldr r0, [r6, #0x8]
    cmp r0, #0x0
    ble .L_4d4
    ldrh r2, [r6, #0x14]
    ldr r0, _LIT15
    mov r1, #0x1
    str r2, [r0, #0xc0]
    str r1, [r0, #0xb8]
    sub r1, r1, #0x81
    str r1, [r0, #0xc4]
    b .L_4ec
.L_4d4:
    ldr r0, _LIT16
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT17
    mov r1, #0x1
    bl func_ov019_021b52f0
.L_4ec:
    mov r0, #0x1
    add sp, sp, #0x70
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov019_021b5e70
_LIT1: .word 0x000004c4
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word data_ov019_021b5bd0
_LIT5: .word data_ov019_021b5bf0
_LIT6: .word data_ov019_021b5c0c
_LIT7: .word 0x00006640
_LIT8: .word data_ov019_021b5c2c
_LIT9: .word data_ov019_021b5c4c
_LIT10: .word data_ov019_021b5a18
_LIT11: .word 0x000076f4
_LIT12: .word 0x05000600
_LIT13: .word 0x00006a82
_LIT14: .word 0x05000640
_LIT15: .word data_ov019_021b6848
_LIT16: .word 0x000006d2
_LIT17: .word data_ov019_021b6920

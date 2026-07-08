; func_ov002_0229f6d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbab4
        .extern data_ov002_022cbacc
        .extern data_ov002_022cbae4
        .extern data_ov002_022cbafc
        .extern data_ov002_022cbb14
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0209445c
        .global func_ov002_0229f6d8
        .arm
func_ov002_0229f6d8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x78
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, #0x0
    cmp r0, #0xc
    bgt .L_5c
    cmp r0, #0x0
    addge pc, pc, r0, lsl #0x2
    b .L_d0
    b .L_d0
    b .L_d0
    b .L_d0
    b .L_d0
    b .L_68
    b .L_70
    b .L_70
    b .L_c8
    b .L_d0
    b .L_70
    b .L_d0
    b .L_d4
    b .L_d4
.L_5c:
    cmp r0, #0x20
    beq .L_d4
    b .L_d0
.L_68:
    ldr r4, _LIT0
    b .L_d4
.L_70:
    ldr r4, _LIT1
    add r0, sp, #0x50
    bl func_0201d428
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT2
    ldrh r1, [sp, #0x64]
    str r0, [sp, #0x50]
    str r2, [sp, #0x5c]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mvn r1, #0x0
    add r0, sp, #0x50
    strh r3, [sp, #0x64]
    strh r1, [sp, #0x60]
    bl func_0201e564
    ldr r0, [sp, #0x50]
    bl func_02006e00
    ldr r4, _LIT3
    b .L_d4
.L_c8:
    ldr r4, _LIT4
    b .L_d4
.L_d0:
    ldr r4, _LIT3
.L_d4:
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    bge .L_12c
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mvn r2, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x28]
    str r2, [sp, #0x34]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mov r1, #0x160
    add r0, sp, #0x28
    strh r3, [sp, #0x3c]
    strh r1, [sp, #0x38]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
.L_12c:
    cmp r4, #0x0
    addeq sp, sp, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, sp, #0x0
    bl func_0201d428
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldr r2, _LIT6
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    str r2, [sp, #0xc]
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mov r1, #0x140
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    ldr r0, _LIT7
    add r1, r5, #0x74
    mov r2, #0x20
    bl func_0209445c
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cbab4
_LIT1: .word data_ov002_022cbacc
_LIT2: .word 0x0000c980
_LIT3: .word data_ov002_022cbae4
_LIT4: .word data_ov002_022cbafc
_LIT5: .word data_ov002_022cbb14
_LIT6: .word 0x0000b980
_LIT7: .word 0x05000740

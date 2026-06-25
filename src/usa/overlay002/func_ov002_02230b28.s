; func_ov002_02230b28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022cd344
        .extern data_ov002_022cd34c
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern func_ov002_021d6718
        .global func_ov002_02230b28
        .arm
func_ov002_02230b28:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldrh r2, [r0, #0x4]
    ldr r3, [r1, #0x38]
    ldr r5, _LIT1
    mov r1, r2, lsl #0x11
    cmp r3, r1, lsr #0x17
    moveq r1, #0x1
    movne r1, #0x0
    mov r2, #0x38
    mul lr, r1, r2
    ldr r1, _LIT2
    add r2, r2, #0x830
    ldr r1, [r1, lr]
    mov ip, #0x14
    and r4, r1, #0x1
    mul r3, r4, r2
    ldr r2, [r5, lr]
    ldr r4, _LIT3
    ldr r5, _LIT4
    add r4, r4, r3
    mul ip, r2, ip
    add r4, r4, #0x30
    ldr r4, [r4, ip]
    ldr r5, [r5, lr]
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r5, r4
    bne .L_998
    ldr lr, _LIT5
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    bne .L_998
    mov ip, #0x1
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6718
.L_998:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd344
_LIT2: .word data_ov002_022cd340
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cd34c
_LIT5: .word data_ov002_022cf0c2

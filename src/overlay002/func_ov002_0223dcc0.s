; func_ov002_0223dcc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d59cc
        .extern func_ov002_021d86fc
        .extern func_ov002_0223db04
        .global func_ov002_0223dcc0
        .arm
func_ov002_0223dcc0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldrh r3, [r8, #0x6]
    mov r7, r1
    mov r6, r2
    mov r3, r3, lsl #0x18
    mov r3, r3, lsr #0x18
    cmp r3, #0x5
    bcs .L_30
    bl func_ov002_0223db04
    b .L_44
.L_30:
    bne .L_44
    ldr r0, _LIT0
    add r1, r8, r3, lsl #0x1
    ldr r0, [r0, #0x494]
    strh r0, [r1, #0x8]
.L_44:
    ldr r0, _LIT1
    and r1, r7, #0x1
    mul r5, r1, r0
    mov r0, #0x14
    mul r4, r6, r0
    ldr r1, _LIT2
    add r0, r1, r5
    add r0, r0, #0x30
    ldr r2, [r0, r4]
    ldrh r0, [r8, #0x6]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r0, lsl #0x18
    mov ip, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r0, r7
    mov r1, r6
    add r2, r2, ip, lsr #0x1f
    mov r3, r3, lsr #0x18
    bl func_ov002_021d86fc
    ldrh r2, [r8, #0x6]
    ldr r1, _LIT3
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    strh r0, [r8, #0x6]
    add r0, r1, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
    cmp r6, #0x4
    addgt sp, sp, #0x4
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9ecc
    ldr r1, _LIT4
    cmp r0, r1
    addne r1, r1, #0x2
    cmpne r0, r1
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
    ldrh r1, [r8, #0x4]
    ldr r2, _LIT4
    mov r0, r7
    mov r1, r1, lsl #0x11
    mov r4, r1, lsr #0x17
    mov r1, r6
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021d59cc
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word 0x00001596

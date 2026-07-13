; func_ov020_021aa620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adf80
        .extern func_02038a84
        .extern func_0209281c
        .extern func_02097db0
        .extern func_02097efc
        .extern func_02097f44
        .extern func_02098294
        .extern func_ov020_021aa59c
        .global func_ov020_021aa620
        .arm
func_ov020_021aa620:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x88
    mov r3, #0xe
    mul r3, r0, r3
    ldr r0, _LIT0
    movs r4, r2
    ldr r0, [r0, #0xa94]
    mov r5, r1
    add r1, r0, r3, lsl #0x2
    add r2, r1, r5, lsl #0x3
    ldmia r2, {r6, r7}
    addeq sp, sp, #0x88
    moveq r0, r7
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    movle r0, #0x0
    strleb r0, [r4]
    ble .L_9c
    add r0, sp, #0x40
    bl func_02098294
    add r0, sp, #0x0
    add r1, r5, #0x1
    bl func_ov020_021aa59c
    add r0, sp, #0x40
    add r1, sp, #0x0
    bl func_02097f44
    add r0, sp, #0x40
    mov r1, r6
    mov r2, #0x0
    bl func_02097db0
    mov r0, r4
    mov r1, #0x200
    bl func_0209281c
    mov r1, r4
    add r0, sp, #0x40
    mov r2, r7
    bl func_02038a84
    add r0, sp, #0x40
    bl func_02097efc
.L_9c:
    mov r0, r7
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov020_021adf80

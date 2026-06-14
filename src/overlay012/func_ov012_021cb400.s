; func_ov012_021cb400 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b56b4
        .extern data_ov012_021cc120
        .extern data_ov012_021cc6dc
        .extern func_0202c0c0
        .extern func_ov000_021add24
        .extern func_ov000_021adf18
        .global func_ov012_021cb400
        .arm
func_ov012_021cb400:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x40
    ldr r4, _LIT0
    mov r2, #0x28
    mla r8, r0, r2, r4
    ldr r3, _LIT1
    ldr r7, _LIT2
    ldr r0, [r3, r1, lsl #0x2]
    mov r9, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x18
    add sl, r0, #0x21
    add r6, sp, #0x0
    mov r5, #0xc
    mov r4, #0x100
.L_3b4:
    add r0, sl, #0x500
    bl func_0202c0c0
    mov r1, r9
    mov r2, r6
    bl func_ov000_021adf18
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov000_021add24
    add r1, r8, r9, lsl #0x3
    sub r2, r0, #0xa
    ldrsh r0, [r1, #0xa]
    add r1, r7, r9, lsl #0x1
    strb r2, [r1, #0x174]
    add r0, r0, #0x6
    strb r0, [r1, #0x175]
    add r9, r9, #0x1
    cmp r9, #0x4
    blt .L_3b4
    add sp, sp, #0x40
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov000_021b56b4
_LIT1: .word data_ov012_021cc120
_LIT2: .word data_ov012_021cc6dc

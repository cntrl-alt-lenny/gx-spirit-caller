; func_02088268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5184
        .extern func_02094f14
        .extern func_02095d6c
        .global func_02088268
        .arm
func_02088268:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    str r1, [r7, #0x3c]
    ldr r0, [r7, #0x48]
    mov r5, #0x0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    mov r8, #0x1
.L_dc:
    add r0, r7, r5
    ldrb r6, [r0, #0x4c]
    ldr r1, [r7, #0x3c]
    add r0, r4, r6, lsl #0x3
    ldr r0, [r0, #0x4]
    add r0, r1, r0
    bl func_02095d6c
    mov r2, r0
    mov r0, r8, lsl r6
    and r1, r2, #0xff
    mov r2, r2, asr #0x8
    bl func_02094f14
    ldr r0, [r7, #0x48]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_dc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021a5184

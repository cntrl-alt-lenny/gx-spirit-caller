; func_0203c6e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d8d8
        .extern func_020aaf60
        .global func_0203c6e0
        .arm
func_0203c6e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr sl, [r1]
    mov r4, #0xc0
    ldrb r7, [sl, #0xd13]
    add r5, sl, r0
    ldrb r0, [sl, #0xd0d]
    mla r9, r7, r4, r5
    cmp r0, #0x6
    movcs r0, #0x1
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r6, [sl, #0xd12]
    mov r8, #0x0
    cmp r6, #0x0
    bls .L_90
.L_40:
    cmp r8, r7
    beq .L_80
    add r0, sl, r8, lsl #0x2
    ldrb r0, [r0, #0x445]
    cmp r0, #0x6
    bcs .L_80
    mul r1, r8, r4
    add r0, sl, r1
    add r0, r0, #0x400
    ldrh r2, [r0, #0x7a]
    mov r0, r9
    add r1, r5, r1
    bl func_020aaf60
    cmp r0, #0x0
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_80:
    add r0, r8, #0x1
    and r8, r0, #0xff
    cmp r8, r6
    bcc .L_40
.L_90:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219d8d8
_LIT1: .word 0x00000474

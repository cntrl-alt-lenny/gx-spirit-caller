; func_0203b664 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203aef4
        .extern func_0209445c
        .global func_0203b664
        .arm
func_0203b664:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0xb0]
    mov r9, r1
    tst r0, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r8, [sl, #0x78]
    add r0, r8, #0x20
    cmp r9, r0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [sl, #0xbf]
    cmp r0, #0x0
    beq .L_7e4
    mov r4, #0x0
    mov r5, r9
    mov r6, r8
    mov r7, r4
    mov fp, #0x200
.L_7a4:
    ldrh r1, [r6, #0x12]
    ldrh r0, [r5, #0x12]
    cmp r1, r0
    beq .L_7c8
    ldr r0, [sl, #0x84]
    mov r2, fp
    add r1, r0, r7
    add r0, r1, #0x200
    bl func_0209445c
.L_7c8:
    ldrh r0, [sl, #0xb8]
    add r4, r4, #0x1
    add r5, r5, #0xc
    cmp r4, r0
    add r6, r6, #0xc
    add r7, r7, #0x400
    bcc .L_7a4
.L_7e4:
    mov r4, r8
    ldmia r9!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r9, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    mov r0, r8
    bl func_0203aef4
    mov r0, #0xff
    strb r0, [r8, #0x17]
    strb r0, [r8, #0xb]
    ldrh r0, [sl, #0xb0]
    bic r0, r0, #0x10
    strh r0, [sl, #0xb0]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

; func_0203aae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203a84c
        .extern func_0203a8dc
        .extern func_0203a950
        .global func_0203aae8
        .arm
func_0203aae8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs r8, r0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrsb r0, [r8, #0x59]
    sub r0, r0, #0x1
    strb r0, [r8, #0x59]
    ldrsb r0, [r8, #0x59]
    cmp r0, #0x0
    movle r0, #0x0
    strle r0, [r8, #0x4]
    strleb r0, [r8, #0x58]
    mov r0, r8
    bl func_0203a950
    mvn r7, #0x0
    add r6, r8, #0x34
    add r5, r8, #0x14
    add r9, r7, #0x10000
    mov r4, #0x1
    mov sl, #0x0
.L_1e9c:
    ldr r0, [r5]
    cmp r0, r9
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, [r6]
    add r7, r7, #0x1
    cmp r2, #0x0
    bne .L_1ecc
    ldrh r1, [r8, #0x54]
    tst r1, r4, lsl r7
    bne .L_1ecc
    bl func_0203a84c
    mov r2, r0
.L_1ecc:
    cmp r2, #0x0
    beq .L_1ef4
    ldrb r0, [r2, #0x1c]
    sub r0, r0, #0x1
    strb r0, [r2, #0x1c]
    tst r0, #0xff
    bne .L_1ef4
    mov r0, r2
    bl func_0203a8dc
    str sl, [r6]
.L_1ef4:
    add r5, r5, #0x4
    add r6, r6, #0x4
    b .L_1e9c

; func_0203ea58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c8b0
        .global func_0203ea58
        .arm
func_0203ea58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x10
    bl func_0203c8b0
    add r0, r0, #0xd00
    ldrh r2, [r0, #0x16]
    cmp r2, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov ip, #0x0
    mov r3, ip
    mov r1, #0x1
.L_12c:
    mov r0, r1, lsl ip
    ands r0, r2, r0
    beq .L_150
    cmp r3, r4
    moveq r0, ip, lsl #0x18
    moveq r0, r0, asr #0x18
    ldmeqia sp!, {r4, pc}
    add r0, r3, #0x1
    and r3, r0, #0xff
.L_150:
    add r0, ip, #0x1
    and ip, r0, #0xff
    cmp ip, #0xd
    bcc .L_12c
    mvn r0, #0x0
    ldmia sp!, {r4, pc}

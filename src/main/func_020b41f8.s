; func_020b41f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b41d4
        .global func_020b41f8
        .arm
func_020b41f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r2
    ldr r5, [r6]
    mov r7, r1
    cmp r5, #0x0
    mov r4, #0x0
    bls .L_48
.L_1c:
    bl func_020b41d4
    and r1, r0, #0xff
    cmp r1, #0xd
    strb r0, [r7, r4]
    cmpne r1, #0xa
    addeq r0, r4, #0x1
    streq r0, [r6]
    beq .L_48
    add r4, r4, #0x1
    cmp r4, r5
    bcc .L_1c
.L_48:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

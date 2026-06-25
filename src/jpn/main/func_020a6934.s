; func_020a6934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6934
        .arm
func_020a6934:
    stmdb sp!, {r4, lr}
    ldrsb r2, [r0]
    mov r4, #0x0
    cmp r2, #0x0
    beq .L_60
    mov r3, r4
.L_18:
    mov lr, r3
    b .L_24
.L_20:
    add lr, lr, #0x1
.L_24:
    ldrsb ip, [r1, lr]
    cmp ip, #0x0
    beq .L_40
    add r2, r4, lr
    ldrsb r2, [r0, r2]
    cmp r2, ip
    beq .L_20
.L_40:
    cmp ip, #0x0
    addeq r0, r0, r4
    ldmeqia sp!, {r4, lr}
    bxeq lr
    add r4, r4, #0x1
    ldrsb r2, [r0, r4]
    cmp r2, #0x0
    bne .L_18
.L_60:
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr

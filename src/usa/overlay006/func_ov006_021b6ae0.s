; func_ov006_021b6ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b6ae0
        .arm
func_ov006_021b6ae0:
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_150
    b .L_124
    b .L_134
    b .L_144
    b .L_148
.L_124:
    add r1, r0, #0x248
    mov r0, #0x124
    mla r0, r2, r0, r1
    bx lr
.L_134:
    add r0, r0, #0xb50
    add r1, r0, #0x3000
    mov r0, #0x124
    mla r0, r2, r0, r1
.L_144:
    bx lr
.L_148:
    add r0, r0, #0x124
    bx lr
.L_150:
    mov r0, #0x0
    bx lr

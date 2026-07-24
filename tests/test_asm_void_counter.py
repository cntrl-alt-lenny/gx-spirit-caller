"""Tests for the non-blocking per-PR asm-C visibility counter."""

from pathlib import Path

from tools.asm_void_counter import format_report, has_asm_void, text_bytes_for_sources


def test_asm_void_spellings_are_detected():
    assert has_asm_void("asm void Foo(void) { nop; }")
    assert has_asm_void("asm { mov r0, r1 }")


def test_comments_and_literals_are_not_detected():
    assert not has_asm_void('/* asm void fake(void) */ const char *s = "asm {";')


def test_text_bytes_for_sources_reads_only_selected_tus(tmp_path: Path):
    delinks = tmp_path / "config" / "eur" / "arm9" / "main" / "delinks.txt"
    delinks.parent.mkdir(parents=True)
    delinks.write_text(
        ".text start:0x02000000 end:0x02000020\n"
        "src/main/asm.c:\n"
        "    .text start:0x02000000 end:0x02000010\n"
        "src/main/natural.c:\n"
        "    .text start:0x02000010 end:0x02000018\n",
        encoding="utf-8",
    )
    assert text_bytes_for_sources({"src/main/asm.c"}, "eur", root=tmp_path) == 16


def test_format_report_is_pr_summary_ready():
    output = format_report({
        "region": "eur",
        "changed_c_files": 3,
        "asm_void_files": 1,
        "asm_void_text_bytes": 24,
        "files": ["src/main/asm.c"],
    })
    assert "24 .text bytes" in output
    assert "src/main/asm.c" in output

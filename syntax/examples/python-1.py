@cache(size=2)
async def main():
    value = f"hi { {'n': 42} } tail"
    rendered = t"Hello {value}"
    return True

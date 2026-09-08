def format_follower_count(n):
    """Formats raw follower counts into Instagram-style strings (e.g., 1.5K, 2.3M)."""
    if n >= 1_000_000_000:
        return f"{n / 1_000_000_000:.1f}B".replace('.0', '')
    elif n >= 1_000_000:
        return f"{n / 1_000_000:.1f}M".replace('.0', '')
    elif n >= 1_000:
        return f"{n / 1_000:.1f}K".replace('.0', '')
    return str(n)
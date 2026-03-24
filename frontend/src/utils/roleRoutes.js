export function normalizeRole(role) {
  return String(role || "").toLowerCase().trim();
}

export function getHomeRouteForRole(role) {
  const normalizedRole = normalizeRole(role);

  if (normalizedRole.includes("super admin")) {
    return "/super-admin";
  }

  if (normalizedRole.includes("admin")) {
    return "/admin";
  }

  if (normalizedRole.includes("coach")) {
    return "/coach";
  }

  return "/employee";
}

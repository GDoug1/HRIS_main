import { apiFetch } from "./api";

export async function fetchMyRequests() {
  return apiFetch("api/shared/my_requests.php");
}

export async function submitRequest(payload) {
  const isFormData = payload instanceof FormData;

  return apiFetch("api/shared/create_request.php", {
    method: "POST",
    body: isFormData ? payload : JSON.stringify(payload)
  });
}

export async function fetchTeamRequests() {
  return apiFetch("api/coach/coach_team_requests.php");
}

export async function updateTeamRequestStatus(payload) {
  return apiFetch("api/coach/coach_update_request_status.php", {
    method: "POST",
    body: JSON.stringify(payload)
  });
}

export async function fetchAdminTeamRequests() {
  return apiFetch("api/admin/admin_team_requests.php");
}

export async function updateAdminTeamRequestStatus(payload) {
  return apiFetch("api/admin/admin_update_team_request_status.php", {
    method: "POST",
    body: JSON.stringify(payload)
  });
}
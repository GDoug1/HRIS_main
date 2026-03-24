import { Routes, Route, Navigate } from "react-router-dom";

import Login from "./pages/Login";
import Register from "./pages/Register";
import AdminDashboard from "./pages/AdminDashboard";
import SuperAdminDashboard from "./pages/SuperAdminDashboard";
import CoachDashboard from "./pages/CoachDashboard";
import EmployeeDashboard from "./pages/EmployeeDashboard";

import ProtectedRoute from "./routes/ProtectedRoute";
import { FeedbackProvider } from "./components/FeedbackProvider";
import useCurrentUser from "./hooks/useCurrentUser";
import { getHomeRouteForRole } from "./utils/roleRoutes";

function DefaultRoute() {
  const { user, loading } = useCurrentUser();

  if (loading) {
    return <div>Loading...</div>;
  }

  if (!user) {
    return <Navigate to="/login" replace />;
  }

  return <Navigate to={getHomeRouteForRole(user.role)} replace />;
}

function LoginRoute() {
  const { user, loading } = useCurrentUser();

  if (loading) {
    return <div>Loading...</div>;
  }

  if (user) {
    return <Navigate to={getHomeRouteForRole(user.role)} replace />;
  }

  return <Login />;
}

export default function App() {
  return (
    <FeedbackProvider>
      <Routes>
        {/* PUBLIC */}
        <Route path="/" element={<DefaultRoute />} />
        <Route path="/login" element={<LoginRoute />} />
        <Route path="/register" element={<Register />} />

        {/* PROTECTED */}
        <Route
          path="/admin"
          element={
            <ProtectedRoute allowedRoles={["admin"]}>
              <AdminDashboard />
            </ProtectedRoute>
          }
        />

        <Route
          path="/super-admin"
          element={
            <ProtectedRoute allowedRoles={["super admin"]}>
              <SuperAdminDashboard />
            </ProtectedRoute>
          }
        />

        <Route
          path="/coach"
          element={
            <ProtectedRoute allowedRoles={["coach"]}>
              <CoachDashboard />
            </ProtectedRoute>
          }
        />

        <Route
          path="/coach/attendance"
          element={
            <ProtectedRoute allowedRoles={["coach"]}>
              <CoachDashboard />
            </ProtectedRoute>
          }
        />

        <Route
          path="/employee"
          element={
            <ProtectedRoute>
              <EmployeeDashboard />
            </ProtectedRoute>
          }
        />

        {/* FALLBACK */}
        <Route path="*" element={<DefaultRoute />} />
      </Routes>
    </FeedbackProvider>
  );
}
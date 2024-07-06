import React, { useState, useEffect, useCallback } from "react";
import { useNavigate } from "react-router-dom";
import "./HomeSection.css";
import Logo from "../../Logo/Logo";
import Standing from "../../Table/Standing/Standing";
import MatchSchedule from "../../Table/MatchSchedule/MatchSchedule";
import Button from "../../Button/Button";
import NavLink from "../../NavLink/NavLink.js";
import CircularProgress from '@mui/material/CircularProgress';

function HomeSection() {
  const [listOfRank, setListOfRank] = useState([]);
  const [listOfMatch, setListOfMatch] = useState([]);
  const [isLoading, setisLoading] = useState(false);
  let navigate = useNavigate();

  const ScheduleClick = useCallback(
    () => navigate("/MatchSchedulePage", { replace: true }),
    [navigate]
  );
  const StandingClick = useCallback(
    () => navigate("/StandingPage", { replace: true }),
    [navigate]
  );

  useEffect(() => {
    const fetchSectionData = async () => {
      setisLoading(true);
      try {
        let data = JSON.parse(localStorage.getItem("rankData"));
        let data2 = JSON.parse(localStorage.getItem("matchesData"));
        let teamData = JSON.parse(localStorage.getItem("clubsData"));

        if (!data) {
          data = await fetch("https://premier-league-management-production.up.railway.app/api/rank").then((res) =>
            res.json()
          );
          data.sort((rankA, rankB) => rankA.Hang - rankB.Hang);
          localStorage.setItem("rankData", JSON.stringify(data));
        }

        if (!data2) {
          data2 = await fetch("https://premier-league-management-production.up.railway.app/api/matches").then((res) =>
            res.json()
          );
          localStorage.setItem("matchesData", JSON.stringify(data2));
        }

        if (!teamData) {
          teamData = await fetch("https://premier-league-management-production.up.railway.app/api/clubs").then((res) =>
            res.json()
          );
          teamData.sort((A, B) => A.ID_Doi_Bong - B.ID_Doi_Bong);
          localStorage.setItem("clubsData", JSON.stringify(teamData));
        }

        data.sort((A, B) => A.DOI_BONG_ID_Doi_Bong - B.DOI_BONG_ID_Doi_Bong);
        const newData = data.map((element, i) => ({ ...data[i], ...teamData[i] }));
        newData.sort((rankA, rankB) => rankA.Hang - rankB.Hang);
        setListOfRank([...newData]);

        //Today match
        const today = new Date().toLocaleDateString();
        const todayMatch = data2.filter(
          (m) => new Date(m.Lich_Thi_Dau).toLocaleDateString() === today
        );
        setListOfMatch([...todayMatch]);
        setisLoading(false);
      } catch (e) {
        console.log(e.message);
      }
    };

    fetchSectionData();
  }, []);

  return (
    <div className="HomeSection">
      {isLoading && (
        <div className="loading-overlay">
          <CircularProgress />
        </div>
      )}
      <div className="HomeSectionHeader">
        <Logo value="Premier League"></Logo>
      </div>

      <div className="HomeSectionWrapper">
        <div className="HomeSectionItem HomeSectionNav" style={{ marginLeft: 0 }}>
          <div className="HomeSectionNavWrapper">
            <Button>
              <NavLink href={"./MatchSchedulePage"}>Match Schedule</NavLink>
            </Button>
            <Button>
              <NavLink href={"./MatchResultPage"}>Match Result</NavLink>
            </Button>
          </div>
        </div>
        {isLoading ? (
          "Loading.."
        ) : (
          <div className="HomeSectionTable">
            <div className="HomeSectionItem HomeSectionStanding" onClick={StandingClick}>
              <Standing rankData={[...listOfRank]}></Standing>
            </div>
            <div className="HomeSectionItem HomeSectionSchedule" onClick={ScheduleClick}>
              <MatchSchedule
                MatchSchedule={[...listOfMatch]}
                disableBtn={true}
                headerContent="Today match"
              ></MatchSchedule>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

export default HomeSection;

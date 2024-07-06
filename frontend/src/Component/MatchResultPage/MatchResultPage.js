import React, { useState, useEffect } from "react";
import StandingPageNavBar from "../StandingPage/StandingPageNavBar/StandingPageNavBar";
import "./MatchResultPage.css";
import axios from "axios";

import MatchResult from "../Table/MatchResult/MatchResult";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useNavigate } from "react-router-dom";
import {
  faS,
  faCaretLeft,
  faCaretRight,
} from "@fortawesome/free-solid-svg-icons";

function MatchResultPage(props) {
  const [listOfMatchResult, setListOfMatchResult] = useState([]);
  const resultNavigate = useNavigate();
  let resultData = [...listOfMatchResult];
  let [currentPage, setCurrentPage] = useState(0);
  const [PlayerPerPage] = useState(3);
  let maxPage = Math.floor((resultData?.length - 1) / PlayerPerPage);
  let startItem = currentPage * PlayerPerPage;
  let endItem = startItem + PlayerPerPage;

  let renderResultList = resultData?.slice(startItem, endItem);

  const gotoScorePage = (info) => {
    return resultNavigate(`./ScorePage/?id=${info.TRAN_DAU_ID_Tran_Dau}`, {
      state: {
        team1: info.Ten_Doi_Thang,
        team2: info.Ten_Doi_Thua,
        point1: info.Ti_So[0],
        point2: info.Ti_So[2],
        time: info.time,
        day: info.date,
        logo1: info.Logo_Doi_Thang[0].Logo,
        logo2: info.Logo_Doi_Thua[0].Logo,
        playerScore: info.Player_Score,
      },
    });
  };
  useEffect(() => {
    const fetchMatchResult = async () => {
      try {
        const data = await fetch("https://premier-league-management-production.up.railway.app/api/matchResult").then(
          (res) => res.json()
        );
        console.log(data);
        setListOfMatchResult([...data]);
      } catch (e) {
        console.log(e.message);
      }
    };

    fetchMatchResult();
  }, []);
  function nextClick() {
    return currentPage < maxPage
      ? setCurrentPage(currentPage + 1)
      : currentPage;
  }
  function prevClick() {
    return currentPage > 0 ? setCurrentPage(currentPage - 1) : currentPage;
  }
  const renderResultListWithDate = renderResultList?.map((m) => {
    const date = new Date(m.Ngay_gio);
    const getHour = date.toTimeString().slice(0, 5);
    const getDate = date.toDateString().slice(4);

    return { ...m, time: getHour, date: getDate };
  });

  function handleMatchResultClick() {
    const matchContainer = document.querySelector(".MatchResultContent");
    matchContainer.addEventListener("click", function (e) {
      const MatchResult = e.target.closest(".MatchResult");
      const couple = MatchResult.querySelectorAll(".MatchResultTeamInfo");
      const team1 = couple[0].innerText;
      const team2 = couple[1].innerText;
      const teamChoose = renderResultListWithDate.filter(
        (r) => r.Ten_Doi_Thang === team1 && r.Ten_Doi_Thua === team2
      );

      gotoScorePage(teamChoose[0]);
    });
  }
  return (
    <div className="MatchResultPage">
      <StandingPageNavBar Logo="Match Result" />
      <div className="MatchResultTable">
        <div className="MatchResultHeader">
          <div className="Round">Round: {props.round}2</div>
        </div>
        <div>
          <div onClick={handleMatchResultClick} className="MatchResultContent">
            {renderResultListWithDate?.map((r) => {
              return (
                <MatchResult
                  key={r.TRAN_DAU_ID_Tran_Dau}
                  matchResultId={r.TRAN_DAU_ID_Tran_Dau}
                  team1={r.Ten_Doi_Thang}
                  team2={r.Ten_Doi_Thua}
                  point1={r.Ti_So[0]}
                  point2={r.Ti_So[2]}
                  time={r.time}
                  day={r.date}
                  logo1={r.Logo_Doi_Thang[0].Logo}
                  logo2={r.Logo_Doi_Thua[0].Logo}
                  playerScore={r.Player_Score}
                />
              );
            })}
          </div>
          <div className="ControlBtn">
            <FontAwesomeIcon
              className="fai"
              icon={faCaretLeft}
              size="2x"
              onClick={prevClick}
            />
            <FontAwesomeIcon
              className="fai"
              icon={faCaretRight}
              size="2x"
              onClick={nextClick}
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default MatchResultPage;
